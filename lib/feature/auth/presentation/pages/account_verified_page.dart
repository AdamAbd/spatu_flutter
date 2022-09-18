import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class AccountVerifiedPage extends StatelessWidget {
  const AccountVerifiedPage({Key? key}) : super(key: key);

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
                'Created PIN',
                onPressed: () {},
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
            Image.asset(
              AppIllustration.check,
              width: _responsive.getResponsiveIconSize(AppIconSize.dialog + 28),
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
