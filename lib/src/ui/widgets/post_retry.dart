import 'package:flutter/material.dart';
import 'package:mini_post_app/src/domain/post_provider.dart';
import 'package:provider/provider.dart';

class PostRetry extends StatelessWidget {
  const PostRetry({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Ошибка загрузки'),
          ElevatedButton(
            onPressed: context.read<PostProvider>().fetchPosts,
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
