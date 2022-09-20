import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:spatu_flutter/feature/feature.dart';

class AccountVerifiedPage extends StatefulWidget {
  const AccountVerifiedPage({Key? key}) : super(key: key);

  @override
  State<AccountVerifiedPage> createState() => _AccountVerifiedPageState();
}

class _AccountVerifiedPageState extends State<AccountVerifiedPage> {
  late Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pushNamed(context, PagePath.createPin);
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppGap.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: AppButtonSize.large,
              width: double.infinity,
              child: ButtonPrimary(
                '${_start != 0 ? '${_start}s ' : ''}Navigate to Create PIN Page',
                onPressed: () => Navigator.pushNamed(
                  context,
                  PagePath.createPin,
                ),
              ),
            ),
            const Gap(height: AppGap.medium),
            SizedBox(
              height: AppButtonSize.large,
              width: double.infinity,
              child: ButtonPrimary(
                'Get Started',
                buttonColor: Black.secondary,
                labelColor: AppColors.white,
                onPressed: () {},
              ),
            ),
            const Gap(height: AppGap.medium),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: AppIconSize.dialog + 46,
              child: Lottie.asset(
                'assets/lottie/checkmark.json',
                height: AppIconSize.dialog + 28,
                fit: BoxFit.fitWidth,
                repeat: false,
                animate: true,
              ),
            ),
            const Gap(height: AppGap.dialog - 2),
            Text(
              'Account Verified',
              style: AppTextStyle.semiBold.copyWith(
                color: AppColors.white,
                fontSize: _responsive.getResponsiveFontSize(AppFontSize.big),
              ),
            ),
            const Gap(height: AppGap.normal),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppGap.extraLarge,
              ),
              child: Text.rich(
                TextSpan(
                  text:
                      'Your account has been verified succefully. Lets enjoy ',
                  children: [
                    TextSpan(
                      text: 'Spatu',
                      style: AppTextStyle.medium.copyWith(
                        fontSize: _responsive.getResponsiveFontSize(
                          AppFontSize.medium,
                        ),
                      ),
                    ),
                    const TextSpan(text: ' featured'),
                  ],
                ),
                textAlign: TextAlign.center,
                style: AppTextStyle.light.copyWith(
                  fontSize: _responsive.getResponsiveFontSize(
                    AppFontSize.medium,
                  ),
                ),
              ),
            ),
            const Gap(height: AppGap.giant - 20),
          ],
        ),
      ),
    );
  }
}
