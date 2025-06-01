import 'package:flutter/material.dart';

class PACard extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback onTap;

  const PACard({
    super.key,
    required this.title,
    required this.body,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(body),
        onTap: onTap,
      ),
    );
  }
}
