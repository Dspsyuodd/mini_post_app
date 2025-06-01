import 'package:flutter/material.dart';

class PaElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const PaElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
