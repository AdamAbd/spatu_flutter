import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

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
            builder: (args) => const HomePage(),
          );
        }

      //* Auth
      case PagePath.login:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => const LoginPage(),
          );
        }
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
            builder: (args) => VerifyCodePage(
              args: args! as VerifyCodePageArgs,
            ),
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
      case PagePath.resetPassword:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => const ResetPasswordPage(),
          );
        }
      case PagePath.createNewPassword:
        {
          return _buildRouter(
            settings: settings,
            builder: (args) => CreateNewPasswordPage(
              args: args! as CreateNewPasswordPageArgs,
            ),
          );
        }

      default:
        return _buildRouter(
          settings: settings,
          builder: (args) => const HomePage(),
        );
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
