import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spatu_flutter/feature/common/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              final String rawCookie = state.refreshToken!;
              final int index = rawCookie.indexOf(';');
              final String refreshToken =
                  (index == -1) ? rawCookie : rawCookie.substring(0, index);
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
            margin: const EdgeInsets.symmetric(horizontal: AppGap.extraLarge),
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
            margin: const EdgeInsets.symmetric(horizontal: AppGap.extraLarge),
            child: ButtonPrimary(
              'Log Out',
              onPressed: () => Navigator.pushNamed(
                context,
                PagePath.createPin,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
