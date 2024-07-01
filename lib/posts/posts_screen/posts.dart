import 'package:flutter/material.dart';

class AllPost extends StatelessWidget {
  const AllPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All the Posts'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('here all the Posts'),
        ]
      ),
    );
  }
}
