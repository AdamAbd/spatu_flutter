import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.register;
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
    final _responsive = ResponsiveUtils(context);

    return BaseAuthPage(
      title: 'Hello Fish 👋',
      description: 'Create your account & enjoy',
      isLoginPage: false,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              textFieldEntity: _textFieldList[0],
              prefixImage: Image.asset(
                AppIcon.profile,
                width: AppIconSize.large,
              ),
            ),
            const Gap(height: AppGap.medium),
            CustomTextFormField(
              textFieldEntity: _textFieldList[1],
              prefixImage: Image.asset(
                AppIcon.email,
                width: AppIconSize.large,
              ),
            ),
            const Gap(height: AppGap.medium),
            CustomTextFormField(
              textFieldEntity: _textFieldList[2],
              prefixImage: Image.asset(
                AppIcon.password,
                width: AppIconSize.large,
              ),
            ),
            const Gap(height: AppGap.dialog - 2),
            SizedBox(
              height: AppButtonSize.large,
              width: double.infinity,
              child: ButtonPrimary(
                'Sign Up',
                onPressed: () {
                  FocusUtils(context).unfocus();

                  if (_formKey.currentState?.validate() == true) {
                    Navigator.pushNamed(context, PagePath.verifyCode);
                  }
                },
              ),
            ),
            const Gap(height: AppGap.extraLarge),
          ],
        ),
      ),
    );
  }
}
