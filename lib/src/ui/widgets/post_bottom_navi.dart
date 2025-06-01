import 'package:flutter/material.dart';
import 'package:mini_post_app/src/domain/post_page_controller.dart';
import 'package:provider/provider.dart';

class PostBottomNavi extends StatefulWidget {
  const PostBottomNavi({super.key});

  @override
  State<PostBottomNavi> createState() => _PostBottomNaviState();
}

class _PostBottomNaviState extends State<PostBottomNavi> {
  var _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.feedback),
          label: 'Feedback',
        ),
      ],
      onTap: onTap,
    );
  }

  void onTap(int index) {
    context.read<PostPageController>().setPage(index);
    setState(() {
      _currentIndex = index;
    });
  }
}
