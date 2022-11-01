import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spatu_flutter/core/core.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class BaseAuthPage extends StatefulWidget {
  BaseAuthPage({
    super.key,
    required this.title,
    required this.description,
    required this.child,
    required this.isLoginPage,
  });

  final String title;
  final String description;
  final bool isLoginPage;
  final Widget child;

  @override
  State<BaseAuthPage> createState() => _BaseAuthPageState();
}

class _BaseAuthPageState extends State<BaseAuthPage> {
  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return BlocProvider(
      create: (context) => sl<GoogleSignInCubit>(),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => FocusUtils(context).unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppGap.extraLarge),
                    child: Column(
                      children: [
                        const Gap(height: 50, width: double.infinity),
                        Image.asset(AppIcon.logo, height: 50),
                        const Gap(height: AppGap.medium),
                        Text(
                          widget.title,
                          style: AppTextStyle.medium.copyWith(
                            color: AppColors.white,
                            fontSize: _responsive
                                .getResponsiveFontSize(AppFontSize.extraLarge),
                          ),
                        ),
                        const Gap(height: AppGap.extraSmall),
                        Text(
                          widget.description,
                          style: AppTextStyle.regular.copyWith(
                            fontSize: _responsive
                                .getResponsiveFontSize(AppFontSize.medium),
                          ),
                        ),
                        const Gap(height: 50),
                        BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
                          listener: (context, state) {
                            if (state is GoogleSignInLoading) {
                              context.loadingDialog();
                            } else {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName(
                                  widget.isLoginPage
                                      ? PagePath.home
                                      : PagePath.register,
                                ),
                              );
                            }
                            if (state is GoogleLoginSuccess) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                PagePath.accountVerified,
                                (route) => false,
                              );
                            } else if (state is GoogleSignInError) {
                              context.errorDialog(
                                messageBody: state.failure.error?.errors ??
                                    MessageConstant.defaultErrorMessage,
                              );
                            } else if (state is GoogleLoginError) {
                              context.errorDialog(
                                messageBody: state.failure.error?.errors ??
                                    MessageConstant.defaultErrorMessage,
                              );
                            }
                          },
                          builder: (ctxGoogleSignInCubit, state) {
                            return ButtonPrimary(
                              'Sign In with Google',
                              onPressed: () {
                                FocusUtils(context).unfocus();

                                ctxGoogleSignInCubit
                                    .read<GoogleSignInCubit>()
                                    .signInWithGoogle();
                              },
                              // onPressed: () async {
                              //   FocusUtils(context).unfocus();
                              //   await context
                              //       .read<GoogleSignInCubit>()
                              //       .signOutFromGoogle();
                              // },
                              width: double.infinity,
                              labelColor: AppColors.white,
                              buttonColor: Blue.secondary,
                              leading: Image.asset(
                                AppIcon.google,
                                width: AppIconSize.large,
                              ),
                              isLoading: state is GoogleSignInLoading,
                            );
                          },
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
                        widget.child,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.isLoginPage
                                  ? 'Dont have account? '
                                  : 'Already have an account? ',
                              style: AppTextStyle.light.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Hyperlink(
                              widget.isLoginPage ? 'Sign Up' : 'Sign In',
                              onTap: () {
                                widget.isLoginPage
                                    ? Navigator.pushNamed(
                                        context,
                                        PagePath.register,
                                      )
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
        },
      ),
    );
  }
}
