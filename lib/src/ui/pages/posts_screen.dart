import 'package:flutter/material.dart';
import 'package:mini_post_app/src/core/ui/pa_appbar.dart';
import 'package:mini_post_app/src/ui/widgets/post_search_field.dart';
import 'package:mini_post_app/src/ui/widgets/posts_list.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      appBar: PAAppbar(title: 'Posts'),
      body: Column(
        children: [
          PostSearchField(),
          Expanded(
            child: PostsList(),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
