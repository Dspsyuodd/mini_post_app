import 'package:flutter/material.dart';

class PATextFormField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputAction? textInputAction;

  const PATextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.maxLines,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      minLines: 1,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
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
      validator: validator,
    );
  }
}
