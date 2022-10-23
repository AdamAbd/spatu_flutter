import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

enum VerifyType { email, reset }

class VerifyCodePageArgs {
  final VerifyType verifyType;

  const VerifyCodePageArgs({
    required this.verifyType,
  });
}

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({
    super.key,
    required VerifyCodePageArgs args,
  }) : _args = args;

  final VerifyCodePageArgs _args;

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  //* Text Form Field
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.verify;
  final _formKey = GlobalKey<FormState>();
  final List<String> _pin = [];

  @override
  void initState() {
    super.initState();
    sl<PageStackCubit>()
        .saveStack(page: 'verify ${widget._args.verifyType.name}');

    sl<CountdownCubit>().startCountdown();

    for (final i in _textFieldList) {
      i.textController = TextEditingController();
    }
  }

  @override
  void dispose() {
    sl<CountdownCubit>().cancel();

    for (final i in _textFieldList) {
      i.textController.clear();
      i.textController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<VerifyCodeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ResendCodeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<CountdownCubit>(),
        ),
      ],
      child: Form(
        key: _formKey,
        child: BaseAuthInputPage(
          title: 'Verify Code',
          description: 'Please enter the code we just sent to your email ',
          moreDescription: sl<UserCubit>().state.userEntity?.email ?? '',
          button: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
            listener: (context, state) {
              if (state is VerifyCodeLoading) {
                context.loadingDialog();
              } else {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(PagePath.verifyCode),
                );
              }
              if (state is VerifyCodeEmailSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  PagePath.accountVerified,
                  (route) => false,
                );
              } else if (state is VerifyCodeResetSuccess) {
                context.successDialog(
                  messageBody: "Success",
                  buttonText: "OK",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PagePath.createNewPassword,
                      arguments: CreateNewPasswordPageArgs(
                        code: int.parse(_pin.join()),
                      ),
                    );
                  },
                );
              } else if (state is VerifyCodeError) {
                context.errorDialog(
                  messageBody: state.failure.error?.status ??
                      MessageConstant.defaultErrorMessage,
                  onTap: () {
                    for (final i in _textFieldList) {
                      i.textController.clear();
                    }
                  },
                );
              }
            },
            builder: (contextVerifyEmailCubit, state) {
              return ButtonPrimary(
                'Continue',
                onPressed: () {
                  {
                    FocusUtils(context).unfocus();

                    if (_formKey.currentState?.validate() == true) {
                      for (final i in _textFieldList) {
                        _pin.add(i.textController.text);
                      }

                      if (widget._args.verifyType == VerifyType.reset) {
                        contextVerifyEmailCubit
                            .read<VerifyCodeCubit>()
                            .verifyReset(
                              code: int.parse(_pin.join()),
                            );
                      } else {
                        contextVerifyEmailCubit
                            .read<VerifyCodeCubit>()
                            .verifyEmail(
                              code: int.parse(_pin.join()),
                            );
                      }
                    }
                  }
                },
              );
            },
          ),
          children: [
            Row(
              children: List.generate(
                _textFieldList.length,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppGap.extraSmall,
                    ),
                    child: CustomOTPTextFormField(
                      textFieldEntity: _textFieldList[index],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index != _textFieldList.length - 1) {
                            FocusManager.instance.primaryFocus!.nextFocus();
                          } else {
                            FocusUtils(context).unfocus();
                          }
                        } else if (index != 0) {
                          FocusManager.instance.primaryFocus!.previousFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            const Gap(height: AppGap.extraLarge),
            BlocBuilder<CountdownCubit, CountdownState>(
              builder: (context, state) {
                if (state.start <= 0) {
                  sl<CountdownCubit>().cancel();
                }

                return Visibility(
                  visible: state.start == 0,
                  replacement: Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Resend code in ',
                        children: [
                          TextSpan(
                            text: DateHelper().minuteToSecond(state.start),
                            style: AppTextStyle.medium.copyWith(
                              fontSize: _responsive.getResponsiveFontSize(
                                AppFontSize.medium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      style: AppTextStyle.regular.copyWith(
                        fontSize: _responsive.getResponsiveFontSize(
                          AppFontSize.medium,
                        ),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: AppButtonSize.small,
                    child: BlocConsumer<ResendCodeCubit, ResendCodeState>(
                      listener: (context, state) {
                        if (state is ResendCodeSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.message,
                                style: ButtonTextStyle.medium.copyWith(
                                  fontSize: _responsive.getResponsiveFontSize(
                                    AppFontSize.normal,
                                  ),
                                  fontWeight: AppFontWeight.semiBold,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          );
                          sl<CountdownCubit>().reset();
                        } else if (state is ResendCodeError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.failure.error?.errors ??
                                    MessageConstant.defaultErrorMessage,
                                style: ButtonTextStyle.medium.copyWith(
                                  fontSize: _responsive.getResponsiveFontSize(
                                    AppFontSize.normal,
                                  ),
                                  fontWeight: AppFontWeight.semiBold,
                                  color: AppColors.white,
                                ),
                              ),
                              backgroundColor: AppColors.red,
                            ),
                          );
                        }
                      },
                      builder: (contextResendCodeCubit, state) {
                        if (state is ResendCodeLoading) {
                          return const SizedBox(
                            width: AppButtonSize.small,
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ButtonPrimary(
                          'Resend Code',
                          onPressed: () {
                            contextResendCodeCubit
                                .read<ResendCodeCubit>()
                                .resend(
                                  email:
                                      sl<UserCubit>().state.userEntity?.email ??
                                          '',
                                  type: widget._args.verifyType.name,
                                );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
