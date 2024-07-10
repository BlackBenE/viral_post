import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viral_post/models/post_model.dart';
class PostRepository {
  final FirebaseFirestore _firestore;

  PostRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> addPost(Post post) async {
    try {
      await _firestore.collection('posts').add({
        'id': post.id,
        'title': post.name,
        'description': post.description,
      });
    } catch (e) {
      throw Exception('Failed to add post: $e');
    }
  }

  Future<void> updatePost(Post post) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('posts')
          .where('id', isEqualTo: post.id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await _firestore.collection('posts').doc(querySnapshot.docs.first.id).update({
          'title': post.name,
          'description': post.description,
        });
      } else {
        throw Exception('Post not found');
      }
    } catch (e) {
      throw Exception('Failed to update post: $e');
    }
  }

  Future<void> deletePost(int id) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('posts')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await _firestore.collection('posts').doc(querySnapshot.docs.first.id).delete();
      } else {
        throw Exception('Post not found');
      }
    } catch (e) {
      throw Exception('Failed to delete post: $e');
    }
  }

  Future<Post?> getPostById(int id) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('posts')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return Post.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get post: $e');
    }
  }

  Future<List<Post>> getAllPosts() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('posts').get();
      return querySnapshot.docs.map((doc) {
        return Post.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get posts: $e');
    }
  }
}
