import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({Key? key}) : super(key: key);

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final List<TextFieldEntity> _textFieldList = TextFieldEntity.verify;

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

  void _handleOTP() async {
    final List<String> _pin = [];
    for (final i in _textFieldList) {
      _pin.add(i.textController.text);
    }
    await Future.delayed(const Duration(seconds: 1)).then((_) {
      print(_pin.join());
      Navigator.pushNamed(context, PagePath.accountVerified);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return BaseAuthInputPage(
      title: 'Verify Code',
      description: 'Please enter the code we just sent to your email ',
      moreDescription: 'adam2802002@gmail.com',
      button: ButtonPrimary(
        'Continue',
        onPressed: () => _handleOTP(),
      ),
      body: [
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
        Center(
          child: Text.rich(
            TextSpan(
              text: 'Resend code in ',
              children: [
                TextSpan(
                  text: '00:22',
                  style: AppTextStyle.medium.copyWith(
                    fontSize: AppFontSize.medium,
                  ),
                ),
              ],
            ),
            style: AppTextStyle.regular.copyWith(
              fontSize: AppFontSize.medium,
            ),
          ),
        ),
      ],
    );
  }
}
