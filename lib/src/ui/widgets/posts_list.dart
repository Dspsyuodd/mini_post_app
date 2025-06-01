import 'package:flutter/material.dart';
import 'package:mini_post_app/src/models/posts_state.dart';
import 'package:mini_post_app/src/domain/post_provider.dart';
import 'package:mini_post_app/src/ui/widgets/post_retry.dart';
import 'package:mini_post_app/src/ui/widgets/post_view.dart';
import 'package:provider/provider.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostProvider>().filteredState;

    return switch (state) {
      Loading() => const Center(child: CircularProgressIndicator()),
      Data() => PostListView(posts: state.data),
      Error() => const PostRetry(),
    };
  }
}
