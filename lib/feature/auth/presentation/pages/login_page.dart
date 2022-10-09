import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spatu_flutter/feature/feature.dart';
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

    if (sl<PageStackCubit>().state.page == 'verify ${VerifyType.reset.name}') {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => Navigator.pushNamed(
          context,
          PagePath.verifyCode,
          arguments: const VerifyCodePageArgs(verifyType: VerifyType.reset),
        ),
      );
    } else if (sl<PageStackCubit>().state.page ==
        'verify ${VerifyType.email.name}') {
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

    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Builder(
        builder: (context) {
          return BaseAuthPage(
            title: 'Welcome Back!',
            description: sl<UserCubit>().state.userEntity!.username ?? '',
            // description: 'Sign In to your account',
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
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        print("Login Loading");
                      }
                      // else {
                      //   Navigator.popUntil(
                      //     context,
                      //     ModalRoute.withName(PagePath.authenticationLogin),
                      //   );
                      // }

                      if (state is LoginSuccess) {
                        print("Login Success");
                        // context.successDialog(
                        //   messageBody: MessageConstant.successLogin,
                        //   buttonText: "OK",
                        //   onTap: () => Navigator.pushNamedAndRemoveUntil(
                        //     context,
                        //     PagePath.main,
                        //     (route) => false,
                        //   ),
                        // );
                      } else if (state is LoginError) {
                        print("Login Error");
                        // context.errorDialog(
                        //   messageBody: state.failure.error?.message ??
                        //       MessageConstant.defaultErrorMessage,
                        //   onTap: () {},
                        // );
                      }
                    },
                    builder: (contextLoginCubit, state) {
                      return ButtonPrimary(
                        'Sign In',
                        onPressed: () {
                          FocusUtils(context).unfocus();

                          if (_formKey.currentState?.validate() == true) {
                            contextLoginCubit.read<LoginCubit>().login(
                                  email: _textFieldList[0]
                                      .textController
                                      .text
                                      .trim(),
                                  password: _textFieldList[1]
                                      .textController
                                      .text
                                      .trim(),
                                );
                          }
                        },
                      );
                    },
                  ),
                  const Gap(height: AppGap.extraLarge),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
