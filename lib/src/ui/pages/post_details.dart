import 'package:flutter/material.dart';
import 'package:mini_post_app/src/models/post.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post #${post.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
