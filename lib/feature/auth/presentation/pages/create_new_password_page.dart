import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => CreateNewPasswordPageState();
}

class CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final List<TextFieldEntity> _textFieldList =
      TextFieldEntity.createNewPassword;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    sl<PageStackCubit>().saveStack(page: 'login');

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
    return Form(
      key: _formKey,
      child: BaseAuthInputPage(
        button: ButtonPrimary(
          'Create New Password',
          onPressed: () {
            FocusUtils(context).unfocus();

            if (_formKey.currentState?.validate() == true) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                PagePath.home,
                (route) => false,
              );
            }
          },
        ),
        title: 'Create New Password',
        description: 'Please enter valid email where we can send the code',
        children: [
          CustomTextFormField(
            textFieldEntity: _textFieldList[0],
            prefixImage: Image.asset(
              AppIcon.password,
              width: AppIconSize.large,
            ),
          ),
          CustomTextFormField(
            textFieldEntity: _textFieldList[1],
            prefixImage: Image.asset(
              AppIcon.password,
              width: AppIconSize.large,
            ),
            validator: (val) {
              if (val != _textFieldList[0].textController.text) {
                return 'Not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
