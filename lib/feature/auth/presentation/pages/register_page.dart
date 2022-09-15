import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
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

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusUtils(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppGap.extraLarge),
              child: Column(
                children: [
                  const Gap(height: 50, width: double.infinity),
                  Image.asset(AppIcon.logo, height: 50),
                  const Gap(height: AppGap.medium),
                  Text(
                    'Hello Fish 👋',
                    style: AppTextStyle.medium.copyWith(
                      color: AppColors.white,
                      fontSize: _responsive
                          .getResponsiveFontSize(AppFontSize.extraLarge),
                    ),
                  ),
                  const Gap(height: AppGap.extraSmall),
                  Text(
                    'Sign In to your account',
                    style: AppTextStyle.regular.copyWith(
                      fontSize:
                          _responsive.getResponsiveFontSize(AppFontSize.medium),
                    ),
                  ),
                  const Gap(height: 50),
                  SizedBox(
                    height: AppButtonSize.large,
                    child: ButtonIcon(
                      onTap: () {},
                      backgroundColor: Blue.secondary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppIcon.google, width: AppIconSize.large),
                          const Gap(width: AppGap.normal),
                          Text(
                            'Sign In with Google',
                            style: ButtonTextStyle.light,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(height: AppGap.extraLarge),
                  Row(
                    children: [
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          endIndent: AppGap.normal,
                        ),
                      ),
                      Text(
                        'OR',
                        style: AppTextStyle.regular.copyWith(
                          fontSize: _responsive
                              .getResponsiveFontSize(AppFontSize.medium),
                        ),
                      ),
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          indent: AppGap.normal,
                        ),
                      ),
                    ],
                  ),
                  const Gap(height: AppGap.large),
                  Form(
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
                              print('halo');
                            },
                          ),
                        ),
                        const Gap(height: AppGap.dialog - 2),
                        SizedBox(
                          height: AppButtonSize.large,
                          width: double.infinity,
                          child: ButtonPrimary(
                            'Sign In',
                            onPressed: () {},
                          ),
                        ),
                        const Gap(height: AppGap.extraLarge),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have account? ',
                        style: AppTextStyle.light.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Hyperlink(
                        'Sign Up',
                        onTap: () {
                          print('halo');
                        },
                      ),
                    ],
                  ),
                  const Gap(height: AppGap.extraLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
