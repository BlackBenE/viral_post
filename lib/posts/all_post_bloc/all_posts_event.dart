import '../../models/post_model.dart';

abstract class AllPostsEvent {}

class LoadAllPosts extends AllPostsEvent {}

class SelectPost extends AllPostsEvent {
  final Post selectedPost;

  SelectPost(this.selectedPost);
}
