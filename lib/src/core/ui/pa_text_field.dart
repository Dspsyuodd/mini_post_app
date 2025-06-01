import 'package:flutter/material.dart';

class PASearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;

  const PASearchTextField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.textInputAction = TextInputAction.search,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: hintText ?? 'Поиск...',
        prefixIcon: prefixIcon ?? const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
