import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post_model.dart';
import 'create_post_blloc/create_post_bloc.dart';
import 'create_post_blloc/create_post_event.dart';


class CreatePostScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitPost(context),
              child: Text('Submit Post'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitPost(BuildContext context) {
    final post = Post(
      id: DateTime.now().second ,
      name: _nameController.text,
      description: _descriptionController.text,
    );
    context.read<CreatePostsBloc>().add(CreatePost(post));
  }
}