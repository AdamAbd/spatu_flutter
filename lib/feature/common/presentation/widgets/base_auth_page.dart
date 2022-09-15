import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class BaseAuthPage extends StatelessWidget {
  const BaseAuthPage({
    Key? key,
    required this.title,
    required this.description,
    required this.child,
    required this.isLoginPage,
  }) : super(key: key);

  final String title;
  final String description;
  final bool isLoginPage;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusUtils(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppGap.extraLarge),
              child: Column(
                children: [
                  const Gap(height: 50, width: double.infinity),
                  Image.asset(AppIcon.logo, height: 50),
                  const Gap(height: AppGap.medium),
                  Text(
                    title,
                    style: AppTextStyle.medium.copyWith(
                      color: AppColors.white,
                      fontSize: _responsive
                          .getResponsiveFontSize(AppFontSize.extraLarge),
                    ),
                  ),
                  const Gap(height: AppGap.extraSmall),
                  Text(
                    description,
                    style: AppTextStyle.regular.copyWith(
                      fontSize:
                          _responsive.getResponsiveFontSize(AppFontSize.medium),
                    ),
                  ),
                  const Gap(height: 50),
                  SizedBox(
                    height: AppButtonSize.large,
                    child: ButtonIcon(
                      onTap: () {},
                      backgroundColor: Blue.secondary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppIcon.google, width: AppIconSize.large),
                          const Gap(width: AppGap.normal),
                          Text(
                            'Sign In with Google',
                            style: ButtonTextStyle.light,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(height: AppGap.extraLarge),
                  Row(
                    children: [
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          endIndent: AppGap.normal,
                        ),
                      ),
                      Text(
                        'OR',
                        style: AppTextStyle.regular.copyWith(
                          fontSize: _responsive
                              .getResponsiveFontSize(AppFontSize.medium),
                        ),
                      ),
                      const Flexible(
                        child: Divider(
                          thickness: 1,
                          indent: AppGap.normal,
                        ),
                      ),
                    ],
                  ),
                  const Gap(height: AppGap.large),
                  child,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLoginPage
                            ? 'Dont have account? '
                            : 'Already have an account? ',
                        style: AppTextStyle.light.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Hyperlink(
                        isLoginPage ? 'Sign Up' : 'Sign In',
                        onTap: () {
                          isLoginPage
                              ? Navigator.pushNamed(context, PagePath.register)
                              : Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const Gap(height: AppGap.extraLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
