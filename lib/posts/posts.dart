import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../create_poste/create_post.dart';
import '../post_detail/post_detail_screen.dart';
import 'all_post_bloc/all_posts_bloc.dart';
import 'all_post_bloc/all_posts_event.dart';
import 'all_post_bloc/all_posts_state.dart';

class AllPostsScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePostScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<AllPostsBloc, AllPostsState>(
        builder: (context, state) {
          if (state.status == AllPostsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.status == AllPostsStatus.success) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.name),
                  subtitle: Text(post.description),
                  onTap: () {
                    context.read<AllPostsBloc>().add(SelectPost(post));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                );
              },
            );
          }

          if (state.status == AllPostsStatus.error) {
            return Center(child: Text('Failed to load posts: ${state.errorMessage}'));
          }

          if (state.status == AllPostsStatus.postSelected) {
            return Container(); // Optionally handle state if needed
          } else {
            return Center(child: Text('No posts'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final postBloc = context.read<AllPostsBloc>();
          postBloc.add(LoadAllPosts());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
