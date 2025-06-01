import 'package:flutter/material.dart';
import 'package:mini_post_app/src/core/ui/pa_card.dart';
import 'package:mini_post_app/src/models/post.dart';

class PostView extends StatelessWidget {
  const PostView({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return PACard(
      title: post.title,
      body: post.body.split('\n').first,
      onTap: () => Navigator.pushNamed(
        context,
        '/details',
        arguments: post,
      ),
    );
  }
}

class PostListView extends StatelessWidget {
  final List<Post> posts;
  const PostListView({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, i) {
        final post = posts[i];
        return PostView(post: post);
      },
    );
  }
}
