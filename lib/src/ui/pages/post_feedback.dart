import 'package:flutter/material.dart';
import 'package:mini_post_app/src/core/ui/pa_appbar.dart';
import 'package:mini_post_app/src/core/ui/pa_elevated_button.dart';
import 'package:mini_post_app/src/core/ui/pa_text_form_field.dart';

class PostFeedback extends StatefulWidget {
  const PostFeedback({super.key});

  @override
  State<PostFeedback> createState() => _PostFeedbackState();
}

class _PostFeedbackState extends State<PostFeedback>
    with AutomaticKeepAliveClientMixin {
  final _nameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _messageFormKey = GlobalKey<FormState>();

  final _emaiRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const PAAppbar(title: 'Feedback'),
      body: Column(
        children: [
          _PostFeedbackTextForm(
            formKey: _nameFormKey,
            hintText: 'Имя',
            validator: _validateEmty,
            textInputAction: TextInputAction.next,
          ),
          _PostFeedbackTextForm(
            formKey: _emailFormKey,
            hintText: 'Email',
            validator: _validateEmail,
            textInputAction: TextInputAction.next,
          ),
          _PostFeedbackTextForm(
            formKey: _messageFormKey,
            hintText: 'Сообщение',
            validator: _validateEmty,
            maxLines: 5,
            textInputAction: TextInputAction.done,
          ),
          PaElevatedButton(
            text: 'Отправить',
            onPressed: _onSubmit,
          ),
        ],
      ),
    );
  }

  String? _validateEmty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, заполните поле';
    }
    return null;
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Пожалуйста, введите email';
    }
    if (!_emaiRegexp.hasMatch(email)) {
      return 'Пожалуйста, введите корректный email';
    }
    return null;
  }

  void _onSubmit() {
    var isNameValid = _nameFormKey.currentState!.validate();
    var isEmailValid = _emailFormKey.currentState!.validate();
    var isMessageValid = _messageFormKey.currentState!.validate();

    if (isNameValid && isEmailValid && isMessageValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Сообщение отправлено'),
        ),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _PostFeedbackTextForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputAction? textInputAction;

  const _PostFeedbackTextForm({
    required this.hintText,
    this.validator,
    required this.formKey,
    this.maxLines,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Form(
        key: formKey,
        child: PATextFormField(
          textInputAction: textInputAction,
          maxLines: maxLines,
          hintText: hintText,
          validator: validator,
        ),
      ),
    );
  }
}
