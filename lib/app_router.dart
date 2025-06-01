import 'package:flutter/material.dart';
import 'package:mini_post_app/src/models/post.dart';
import 'package:mini_post_app/src/ui/pages/post_details.dart';
import 'package:mini_post_app/src/ui/pages/post_main_screen.dart';

class AppRouter {
  const AppRouter();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const PostMainScreen());
      case '/details':
        final post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => PostDetails(
            post: post,
          ),
        );
      default:
        throw Exception('Route not found');
    }
  }
}
