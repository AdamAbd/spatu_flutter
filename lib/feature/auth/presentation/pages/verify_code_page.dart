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
    });

    Navigator.pushNamed(context, PagePath.accountVerified);
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return GestureDetector(
      onTap: () => FocusUtils(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        bottomSheet: Container(
          margin: const EdgeInsets.all(AppGap.medium),
          height: AppButtonSize.large,
          width: double.infinity,
          child: ButtonPrimary(
            'Continue',
            onPressed: () => _handleOTP(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(height: AppGap.extraLarge),
            Padding(
              padding: const EdgeInsets.only(left: AppGap.extraLarge),
              child: Text(
                'Verify Code',
                style: AppTextStyle.medium.copyWith(
                  fontSize: AppFontSize.extraLarge,
                ),
              ),
            ),
            const Gap(height: AppGap.extraLarge),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppGap.extraLarge,
              ),
              child: Text.rich(
                TextSpan(
                  text: 'Please enter the code we just sent to your email ',
                  children: [
                    TextSpan(
                      text: 'adam2802002@gmail.com',
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
            const Gap(height: AppGap.big + 6),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppGap.medium,
              ),
              child: Row(
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
                              _textFieldList[index].textController.text = value;
                              setState(() {});
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
            Container(),
          ],
        ),
      ),
    );
  }
}
