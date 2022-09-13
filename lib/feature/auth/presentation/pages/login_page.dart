import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Gap(height: 50, width: double.infinity),
            Image.asset('assets/icons/logo.png', height: 50, width: 50),
            const Gap(height: AppGap.medium),
            Text(
              'Welcome Back!',
              style: AppTextStyle.medium.copyWith(
                color: AppColors.white,
                fontSize:
                    _responsive.getResponsiveFontSize(AppFontSize.extraLarge),
              ),
            ),
            const Gap(height: AppGap.extraSmall),
            Text(
              'Sign In to your account',
              style: AppTextStyle.regular.copyWith(
                fontSize: _responsive.getResponsiveFontSize(AppFontSize.medium),
              ),
            ),
            const Gap(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 48,
              width: double.infinity,
              color: Blue.secondary,
              child: Center(
                child: Text(
                  'Sign In with Google',
                  style: AppTextStyle.light.copyWith(color: AppColors.white),
                ),
              ),
            ),
            const Gap(height: AppGap.extraLarge),
            Row(
              children: [
                const Flexible(
                  child: Divider(
                    thickness: 1,
                    indent: 24,
                    endIndent: 12,
                    color: Blue.primary,
                  ),
                ),
                Text(
                  'OR',
                  style: AppTextStyle.regular.copyWith(
                    fontSize:
                        _responsive.getResponsiveFontSize(AppFontSize.medium),
                  ),
                ),
                const Flexible(
                  child: Divider(
                    thickness: 1,
                    indent: 12,
                    endIndent: 24,
                    color: Blue.primary,
                  ),
                ),
              ],
            ),
            const Gap(height: AppGap.large),
            
          ],
        ),
      ),
    );
  }
}
