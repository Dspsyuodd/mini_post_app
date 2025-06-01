import 'package:flutter/material.dart';
import 'package:mini_post_app/src/domain/post_page_controller.dart';
import 'package:mini_post_app/src/ui/pages/post_feedback.dart';
import 'package:mini_post_app/src/ui/pages/posts_screen.dart';
import 'package:mini_post_app/src/ui/widgets/post_bottom_navi.dart';
import 'package:provider/provider.dart';

class PostMainScreen extends StatelessWidget {
  const PostMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: PostBottomNavi(),
      body: PostPageView(),
    );
  }
}

class PostPageView extends StatefulWidget {
const PostPageView({ super.key });

  @override
  State<PostPageView> createState() => _PostPageViewState();
}

class _PostPageViewState extends State<PostPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: context.read<PostPageController>().pageController,
      children: [
        const PostsScreen(),
        const PostFeedback(),
      ],
    );
  }

  @override
  void dispose() {
    context.read<PostPageController>().dispose();
    super.dispose();
  }
}