import 'package:flutter/material.dart';

class PostPageController {
  final _pageController = PageController();

  PageController get pageController => _pageController;

  void setPage(int page) {
    _pageController.jumpToPage(page);
  }

  void dispose() {
    _pageController.dispose();
  }
}