import 'package:flutter/material.dart';

class PAAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PAAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
