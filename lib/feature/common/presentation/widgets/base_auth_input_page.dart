import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class BaseAuthInputPage extends StatelessWidget {
  const BaseAuthInputPage({
    super.key,
    required ButtonPrimary button,
    required List<Widget> texfieldList,
  })  : _button = button,
        _texfieldList = texfieldList;

  final ButtonPrimary _button;
  final List<Widget> _texfieldList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusUtils(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        bottomSheet: Container(
          margin: const EdgeInsets.all(AppGap.medium),
          height: AppButtonSize.large,
          width: double.infinity,
          child: _button,
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
              padding: const EdgeInsets.symmetric(horizontal: AppGap.medium),
              child: Row(
                children: _texfieldList,
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
        ),
      ),
    );
  }
}
