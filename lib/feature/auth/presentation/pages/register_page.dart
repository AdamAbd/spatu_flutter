import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

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

    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: Builder(
        builder: (context) {
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
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterLoading) {
                        print("Register Loading");
                      }
                      // else {
                      //   Navigator.popUntil(
                      //     context,
                      //     ModalRoute.withName(PagePath.authenticationRegister),
                      //   );
                      // }

                      if (state is RegisterSuccess) {
                        print("Register Success : ${state.message}");
                        // context.successDialog(
                        //   messageBody: MessageConstant.successRegister,
                        //   buttonText: "OK",
                        //   onTap: () => Navigator.pushNamedAndRemoveUntil(
                        //     context,
                        //     PagePath.main,
                        //     (route) => false,
                        //   ),
                        // );

                        // Navigator.pushNamed(
                        //   context,
                        //   PagePath.verifyCode,
                        //   arguments: const VerifyCodePageArgs(
                        //     verifyType: VerifyType.email,
                        //   ),
                        // );
                      } else if (state is RegisterError) {
                        print(
                          "Register Error : ${state.failure.error?.errors ?? ''}",
                        );
                        // context.errorDialog(
                        //   messageBody: state.failure.error?.message ??
                        //       MessageConstant.defaultErrorMessage,
                        //   onTap: () {},
                        // );
                      }
                    },
                    builder: (contextRegisterCubit, state) {
                      return ButtonPrimary(
                        'Sign Up',
                        onPressed: () {
                          FocusUtils(context).unfocus();

                          if (_formKey.currentState?.validate() == true) {
                            contextRegisterCubit.read<RegisterCubit>().register(
                                  username: _textFieldList[0]
                                      .textController
                                      .text
                                      .trim(),
                                  email: _textFieldList[1]
                                      .textController
                                      .text
                                      .trim(),
                                  password: _textFieldList[2]
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
