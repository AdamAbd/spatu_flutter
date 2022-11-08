import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class CreateNewPasswordPageArgs {
  final int code;

  const CreateNewPasswordPageArgs({required this.code});
}

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({
    super.key,
    required CreateNewPasswordPageArgs args,
  }) : _args = args;

  final CreateNewPasswordPageArgs _args;

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
    return BlocProvider(
      create: (context) => sl<ResetPasswordCubit>(),
      child: Builder(
        builder: (context) {
          return Form(
            key: _formKey,
            child: BaseAuthInputPage(
              button: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordLoading) {
                    context.loadingDialog();
                  } else {
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(PagePath.createNewPassword),
                    );
                  }
                  if (state is ResetPasswordSuccess) {
                    context.successDialog(
                      messageBody: state.message,
                      buttonText: "OK",
                      onTap: () => Navigator.popUntil(
                        context,
                        ModalRoute.withName(PagePath.login),
                      ),
                    );
                  } else if (state is ResetPasswordError) {
                    context.errorDialog(
                      messageBody: state.failure.error?.errors ??
                          MessageConstant.defaultErrorMessage,
                    );
                  }
                },
                builder: (ctxSendResetCubit, state) {
                  return ButtonPrimary(
                    'Create New Password',
                    onPressed: () {
                      FocusUtils(context).unfocus();

                      if (_formKey.currentState?.validate() == true) {
                        ctxSendResetCubit
                            .read<ResetPasswordCubit>()
                            .resetPassword(
                              code: widget._args.code,
                              password:
                                  _textFieldList[0].textController.text.trim(),
                              passwordConfirmation:
                                  _textFieldList[1].textController.text.trim(),
                            );
                      }
                    },
                  );
                },
              ),
              title: 'Create New Password',
              description:
                  'Please enter valid email where we can send the code',
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
        },
      ),
    );
  }
}
