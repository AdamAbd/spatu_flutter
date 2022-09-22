import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/auth/auth.dart';
import 'package:spatu_flutter/feature/common/common.dart';
import 'package:spatu_flutter/locator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.login;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    for (final i in _textFieldList) {
      i.textController = TextEditingController();
    }

    if (sl<PageStackCubit>().state.page == 'verify') {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => Navigator.pushNamed(
          context,
          PagePath.verifyCode,
          arguments: const VerifyCodePageArgs(verifyType: VerifyType.email),
        ),
      );
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

                  Navigator.pushNamed(context, PagePath.resetPassword);
                },
              ),
            ),
            const Gap(height: AppGap.dialog - 2),
            ButtonPrimary(
              'Sign In',
              onPressed: () {
                FocusUtils(context).unfocus();

                if (_formKey.currentState?.validate() == true) {}
              },
            ),
            const Gap(height: AppGap.extraLarge),
          ],
        ),
      ),
    );
  }
}
