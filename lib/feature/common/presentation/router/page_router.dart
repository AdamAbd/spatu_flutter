import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/locator.dart';

class PageRouter {
  Route<dynamic>? getRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {

      //* Home
      case PagePath.home:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) {
              final String page = sl<PageStackCubit>().state.page;

              if (page == 'verify') {
                return const VerifyCodePage();
              } else {
                return const LoginPage();
              }
            },
          );
        }

      //* Auth
      case PagePath.register:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => const RegisterPage(),
          );
        }
      case PagePath.verifyCode:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => const VerifyCodePage(),
          );
        }
      case PagePath.accountVerified:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => const AccountVerifiedPage(),
          );
        }
      case PagePath.createPin:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => const CreatePinPage(),
          );
        }
      case PagePath.verifyPin:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => const VerifyPinPage(),
          );
        }
      default:
        return null;
    }
  }

  Route<dynamic> _buildRouter({
    required RouteSettings settings,
    required Widget Function(Object? arguments) builder,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => builder(settings.arguments),
    );
  }
}
