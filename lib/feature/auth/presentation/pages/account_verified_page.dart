import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class AccountVerifiedPage extends StatefulWidget {
  const AccountVerifiedPage({Key? key}) : super(key: key);

  @override
  State<AccountVerifiedPage> createState() => _AccountVerifiedPageState();
}

class _AccountVerifiedPageState extends State<AccountVerifiedPage> {
  @override
  void initState() {
    super.initState();
    sl<PageStackCubit>().saveStack(page: 'verified');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    final String rawCookie = sl<UserCubit>().state.refreshToken!;
    final int index = rawCookie.indexOf(';');
    final String refreshToken =
        (index == -1) ? rawCookie : rawCookie.substring(0, index);
    final int idx = refreshToken.indexOf("=");
    final List<String> old =
        refreshToken.substring(idx + 1).trim().split('%7C');

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
                'Create Spatu PIN',
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
                AppLottie.checkmark,
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
            Text(
              // refreshToken.substring(idx + 1).trim(),
              "${old[0]}|${old[1]}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
