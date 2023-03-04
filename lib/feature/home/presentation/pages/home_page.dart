import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserDetailCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LogoutCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: [
                const DashboardScreen(),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.amber,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: BottomNavigationEntity.list.map((menu) {
                return BottomNavigationBarItem(
                  icon: Icon(menu.icon, color: Blue.primary),
                  activeIcon: Icon(
                    menu.activeIcon,
                    color: Yellow.primary,
                  ),
                  label: menu.label,
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
