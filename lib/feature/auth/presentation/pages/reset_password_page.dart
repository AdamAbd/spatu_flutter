import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextFieldEntity _textField = TextFieldEntity.resetPassword;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _textField.textController = TextEditingController();
  }

  @override
  void dispose() {
    _textField.textController.clear();
    _textField.textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SendResetCubit>(),
      child: Form(
        key: _formKey,
        child: BaseAuthInputPage(
          button: BlocConsumer<SendResetCubit, SendResetState>(
            listener: (context, state) {
              if (state is SendResetLoading) {
                context.loadingDialog();
              } else {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(PagePath.resetPassword),
                );
              }
              if (state is SendResetSuccess) {
                final userCubit = sl<UserCubit>();

                /// Logic when access_token is not null or not empty
                userCubit.saveUser(
                  userEntity: UserModel(
                    id: '',
                    username: '',
                    email: _textField.textController.text.trim(),
                    roles: '',
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  ).toUserEntity(),
                );

                context.successDialog(
                  messageBody: state.message,
                  buttonText: "OK",
                  onTap: () => Navigator.pushNamed(
                    context,
                    PagePath.verifyCode,
                    arguments: const VerifyCodePageArgs(
                      verifyType: VerifyType.reset,
                    ),
                  ),
                );
              } else if (state is SendResetError) {
                context.errorDialog(
                  messageBody: state.failure.error?.errors ??
                      MessageConstant.defaultErrorMessage,
                );
              }
            },
            builder: (ctxResetPasswordCubit, state) {
              return ButtonPrimary(
                'Send Code',
                onPressed: () {
                  FocusUtils(context).unfocus();

                  if (_formKey.currentState?.validate() == true) {
                    ctxResetPasswordCubit.read<SendResetCubit>().sendReset(
                          email: _textField.textController.text.trim(),
                        );
                  }
                },
              );
            },
          ),
          title: 'Reset Password',
          description: 'Please enter valid email where we can send the code',
          children: [
            CustomTextFormField(
              textFieldEntity: _textField,
              prefixImage: Image.asset(
                AppIcon.email,
                width: AppSize.w24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
