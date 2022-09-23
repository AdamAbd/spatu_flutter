import 'dart:async';

import 'package:flutter/material.dart';

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

  //* Countdown
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void _handleOTP() {
    FocusUtils(context).unfocus();

    if (_formKey.currentState?.validate() == true) {
      final List<String> _pin = [];
      for (final i in _textFieldList) {
        _pin.add(i.textController.text);
      }
      print(_pin.join());
      Navigator.pushNamedAndRemoveUntil(
        context,
        widget._args.verifyType == VerifyType.email
            ? PagePath.accountVerified
            : PagePath.createNewPassword,
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    sl<PageStackCubit>().saveStack(page: 'verify');

    startTimer();

    for (final i in _textFieldList) {
      i.textController = TextEditingController();
    }

    print('arguments: ${widget._args.verifyType.name}');
  }

  @override
  void dispose() {
    _timer.cancel();

    for (final i in _textFieldList) {
      i.textController.clear();
      i.textController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return Form(
      key: _formKey,
      child: BaseAuthInputPage(
        title: 'Verify Code',
        description: 'Please enter the code we just sent to your email ',
        moreDescription: 'adam2802002@gmail.com',
        button: ButtonPrimary(
          'Continue',
          onPressed: () => _handleOTP(),
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
          if (_start == 0)
            SizedBox(
              height: AppButtonSize.small,
              // width: AppButtonSize.large * 3,
              child: ButtonPrimary(
                'Resend Code',
                onPressed: () {
                  setState(() {
                    _start = 60;
                    startTimer();
                  });
                },
              ),
            )
          else
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Resend code in ',
                  children: [
                    TextSpan(
                      text: DateHelper().minuteToSecond(_start),
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
        ],
      ),
    );
  }
}
