import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/auth/presentation/pages/account_verified_page.dart';
import 'package:spatu_flutter/feature/feature.dart';

class PageRouter {
  Route<dynamic>? getRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {

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
      default:
        return null;
    }
  }

  Route<dynamic> _buildRouter({
    required RouteSettings settings,
    required Widget Function(Object? arguments) builder,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => builder(settings.arguments),
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => builder(settings.arguments),
      );
    }
  }
}
