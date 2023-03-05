import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

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
    final TextFieldEntity textField = TextFieldEntity.search;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserDetailCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LogoutCubit>(),
        ),
      ],
      child: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, menuState) {
          return Builder(
            builder: (context) {
              return Scaffold(
                body: PageView(
                  controller: pageController,
                  onPageChanged: (index) =>
                      context.read<MenuCubit>().changeIndex(index),
                  children: [
                    const DashboardScreen(),
                    const NotificationScreen(),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.amber,
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: menuState.index,
                  onTap: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  backgroundColor: Black.secondary,
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  items: BottomNavigationEntity.list.map((menu) {
                    return BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        menu.icon,
                        width: AppSize.w24,
                      ),
                      activeIcon: SvgPicture.asset(
                        menu.activeIcon,
                        width: AppSize.w24,
                      ),
                      label: menu.label,
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
