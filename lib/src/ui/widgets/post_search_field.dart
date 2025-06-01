import 'package:flutter/material.dart';
import 'package:mini_post_app/src/core/ui/pa_text_field.dart';
import 'package:mini_post_app/src/domain/post_provider.dart';
import 'package:provider/provider.dart';

class PostSearchField extends StatelessWidget {
  const PostSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: PASearchTextField(
        onChanged: (value) {
          context.read<PostProvider>().filter = value;
        },
      ),
    );
  }
}
