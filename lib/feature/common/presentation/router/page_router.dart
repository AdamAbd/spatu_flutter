import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/main.dart';

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
            builder: (args) => const MyHomePage(
              title: 'Flutter Demo Home Page',
            ),
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
