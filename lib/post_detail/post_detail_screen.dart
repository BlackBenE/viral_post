import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viral_post/post_detail/post_detail_bloc/post_detail_event.dart';
import '../models/post_model.dart';
import 'post_detail_bloc/post_detail_bloc.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = post.name;
    _descriptionController.text = post.description;

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedPost = Post(
                  id: post.id,
                  name: _nameController.text,
                  description: _descriptionController.text,
                );
                context.read<PostDetailBloc>().add(UpdatePostDetail(updatedPost));
                Navigator.pop(context);
              },
              child: Text('Update Post'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PostDetailBloc>().add(DeletePostDetail(post));
                Navigator.pop(context);
              },
              child: Text('Delete Post'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}