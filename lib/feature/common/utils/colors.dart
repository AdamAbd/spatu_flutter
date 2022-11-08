import 'package:flutter/material.dart';

class ColorBrightness {
  final Color dark;
  final Color light;
  final Color normal;
  ColorBrightness({
    required this.dark,
    required this.light,
    required this.normal,
  });
}

class ColorVariant {
  final ColorBrightness primary;
  final ColorBrightness secondary;

  ColorVariant({
    required this.primary,
    required this.secondary,
  });
}

class AppColors {
  final ColorVariant blue = ColorVariant(
    primary: ColorBrightness(
      dark: const Color(0xFF28166F),
      light: const Color(0xFF28166F),
      normal: const Color(0xFF28166F),
    ),
    secondary: ColorBrightness(
      dark: const Color(0xFF28166F),
      light: const Color(0xFF28166F),
      normal: const Color(0xFF28166F),
    ),
  );
  static const Color purple = Color(0xFF28166F);
  static const Color yellow = Color(0xFFF8C212);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color background = Black.primary;
  static const Color red = Color(0xFFD8160E);
  static const Color transparant = Colors.transparent;
  static const Color grey = Color(0xFF8C95A2);
  static const Color grey2 = Color(0xFF454545);
  static const Color grey3 = Color(0xFFC6C6C6);
  static const Color grey4 = Color(0xFFE5E5E5);
  static const Color green = Color(0xFF1F9E30);
}

class Black {
  static const primary = Color(0xFF161616);
  static const secondary = Color(0xFF1B1B1B);
}

class Blue {
  static const primary = Color(0xFF808D9E);
  static const secondary = Color(0xFF262832);
  static const tertiary = Color(0xFF1D1E25);
  static const quaternary = Color(0xFFEBEEFF);
}

class Red {
  static const primary = Color(0xFFEC1D5F);
  static const secondary = Color(0xFFFDE8E7);
}

class Green {
  static const primary = Color(0xFF33B26C);
  static const secondary = Color(0xFFD2F9E4);
  static const tertiary = Color(0xFFEAFBEC);
}

class Yellow {
  static const primary = Color(0xFFE8FB7A);
  static const secondary = Color(0xFFFFF7E6);
}

class Grey {
  static const primary = Color(0xFF65696F);
  static const secondary = Color(0xFFF6F8FD);
  static const tertiary = Color.fromARGB(255, 240, 241, 241);
}

class StateColors {
  static const Color success = Green.primary;
  static const Color warning = Yellow.primary;
  static const Color error = Red.primary;
}

class TextFieldColors {
  static const Color backgroundEnable = AppColors.transparant;
  static const Color backgroundDisable = Grey.secondary;
  static const Color text = AppColors.white;
  static const Color hint = Blue.primary;
  static const Color iconInactive = Grey.primary;
  static const Color iconActive = Blue.primary;
  static const Color label = Black.primary;
  static const Color errorBorder = StateColors.error;
  static const Color enabledBorder = Blue.primary;
  static const Color focusedBorder = Yellow.primary;
}
