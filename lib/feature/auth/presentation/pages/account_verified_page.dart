import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class AccountVerifiedPage extends StatefulWidget {
  const AccountVerifiedPage({super.key});

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

    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.w16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: AppSize.w48,
              width: double.infinity,
              child: ButtonPrimary(
                'Create Spatu PIN',
                onPressed: () => Navigator.pushNamed(
                  context,
                  PagePath.createPin,
                ),
              ),
            ),
            const Gap(height: AppSize.w16),
            SizedBox(
              height: AppSize.w48,
              width: double.infinity,
              child: ButtonPrimary(
                'Get Started',
                buttonColor: Black.secondary,
                labelColor: AppColors.white,
                onPressed: () {
                  sl<PageStackCubit>().saveStack(page: 'home');

                  Navigator.pushReplacementNamed(context, PagePath.home);
                },
              ),
            ),
            const Gap(height: AppSize.w16),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: AppSize.w144,
              child: Lottie.asset(
                AppLottie.checkmark,
                height: AppSize.w128,
                fit: BoxFit.fitWidth,
                repeat: false,
                animate: true,
              ),
            ),
            const Gap(height: AppSize.w56),
            Text(
              'Account Verified',
              style: AppTextStyle.semiBold.copyWith(
                color: AppColors.white,
                fontSize: _responsive.getResponsiveFontSize(AppSize.w24),
              ),
            ),
            const Gap(height: AppSize.w12),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.w24,
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
                          AppSize.w16,
                        ),
                      ),
                    ),
                    const TextSpan(text: ' featured'),
                  ],
                ),
                textAlign: TextAlign.center,
                style: AppTextStyle.light.copyWith(
                  fontSize: _responsive.getResponsiveFontSize(
                    AppSize.w16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
