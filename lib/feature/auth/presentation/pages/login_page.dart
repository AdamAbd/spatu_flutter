import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.login;
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    for (final i in _textFieldList) {
      i.textController = TextEditingController();
    }

    setState(() {});
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
      title: 'Welcome Back!',
      description: 'Sign In to your account',
      isLoginPage: true,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              textFieldEntity: _textFieldList[0],
              prefixImage: Image.asset(
                AppIcon.email,
                width: AppIconSize.large,
              ),
            ),
            const Gap(height: AppGap.medium),
            CustomTextFormField(
              textFieldEntity: _textFieldList[1],
              prefixImage: Image.asset(
                AppIcon.password,
                width: AppIconSize.large,
              ),
            ),
            const Gap(height: AppGap.medium),
            Align(
              alignment: Alignment.centerRight,
              child: Hyperlink(
                'Forgot Password?',
                onTap: () {
                  FocusUtils(context).unfocus();
                },
              ),
            ),
            const Gap(height: AppGap.dialog - 2),
            SizedBox(
              height: AppButtonSize.large,
              width: double.infinity,
              child: ButtonPrimary(
                'Sign In',
                onPressed: () {
                  FocusUtils(context).unfocus();
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
