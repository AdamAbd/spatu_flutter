import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.reset;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    for (final i in _textFieldList) {
      i.textController = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final i in _textFieldList) {
      i.textController.clear();
      i.textController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthInputPage(
      button: ButtonPrimary(
        'Send Code',
        onPressed: () {},
      ),
      title: 'Reset Password',
      description: 'Please enter valid email where we can send the code',
      children: [
        CustomTextFormField(
          textFieldEntity: _textFieldList[0],
          prefixImage: Image.asset(
            AppIcon.email,
            width: AppIconSize.large,
          ),
        ),
      ],
    );
  }
}
