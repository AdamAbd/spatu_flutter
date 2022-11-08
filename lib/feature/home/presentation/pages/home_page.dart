import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/core/core.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    switch (sl<PageStackCubit>().state.page) {
      case 'login':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushReplacementNamed(context, PagePath.login),
        );
        break;
      case 'verify email':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushNamed(
            context,
            PagePath.verifyCode,
            arguments: const VerifyCodePageArgs(verifyType: VerifyType.email),
          ),
        );
        break;
      case 'verify reset':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushNamed(
            context,
            PagePath.verifyCode,
            arguments: const VerifyCodePageArgs(verifyType: VerifyType.reset),
          ),
        );
        break;
      case 'verified':
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Navigator.pushReplacementNamed(
            context,
            PagePath.accountVerified,
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LogoutCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (sl<UserCubit>().state.refreshToken?.isNotEmpty == true)
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      final String rawCookie = state.refreshToken!;
                      final int index = rawCookie.indexOf(';');
                      final String refreshToken = (index == -1)
                          ? rawCookie
                          : rawCookie.substring(0, index);
                      final int idx = refreshToken.indexOf("=");
                      final List<String> old =
                          refreshToken.substring(idx + 1).trim().split('%7C');

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: double.infinity),
                          Image.network(
                            state.userEntity?.avatar ??
                                "https://i.ytimg.com/vi/ATf8X5Dj-7Y/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCJn6Vv1Oil0EIDNKiyGbVL5LO7KA",
                          ),
                          const Gap(height: AppGap.normal),
                          Text(
                            state.userEntity?.username ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Gap(height: AppGap.extraSmall),
                          Text(
                            state.userEntity?.email ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Gap(height: AppGap.extraLarge),
                          Text(
                            state.accessToken ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Gap(height: AppGap.extraSmall),
                          Text(
                            '${old[0]}|${old[1]}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    },
                  ),
                const Gap(height: AppGap.medium),
                Container(
                  height: AppButtonSize.small,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppGap.extraLarge),
                  child: ButtonPrimary(
                    'Update Profile',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      PagePath.createPin,
                    ),
                  ),
                ),
                const Gap(height: AppGap.medium),
                Container(
                  height: AppButtonSize.small,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppGap.extraLarge),
                  child: BlocConsumer<LogoutCubit, LogoutState>(
                    listener: (context, state) {
                      if (state is LogoutLoading) {
                        context.loadingDialog();
                      } else {
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName(PagePath.home),
                        );
                      }
                      if (state is LogoutSuccess) {
                        context.successDialog(
                          messageBody: state.message,
                          buttonText: "OK",
                          onTap: () {
                            sl<PageStackCubit>().saveStack(page: 'login');

                            setState(() {});

                            // Navigator.pushNamed(
                            //   context,
                            //   PagePath.createNewPassword,
                            //   arguments: CreateNewPasswordPageArgs(
                            //     code: int.parse(_pin.join()),
                            //   ),
                            // );
                          },
                        );
                      } else if (state is LogoutError) {
                        context.errorDialog(
                          messageBody: state.failure.error?.status ??
                              MessageConstant.defaultErrorMessage,
                        );
                      }
                    },
                    builder: (context, state) {
                      return ButtonPrimary(
                        'Log Out',
                        onPressed: () => context.read<LogoutCubit>().logout(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
