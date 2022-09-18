import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:spatu_flutter/feature/feature.dart';

class AppFontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

// ignore: avoid_classes_with_only_static_members
class AppTextStyle {
  /// FontWeight.w300
  static final TextStyle light = GoogleFonts.inter(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.light,
    color: Blue.primary,
  );

  /// FontWeight.w400
  static final TextStyle regular = GoogleFonts.inter(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.regular,
    color: Blue.primary,
  );

  /// FontWeight.w500
  static final TextStyle medium = GoogleFonts.inter(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.medium,
    color: AppColors.white,
  );

  /// FontWeight.w600
  static final TextStyle semiBold = GoogleFonts.inter(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.semiBold,
    color: Blue.primary,
  );

  /// FontWeight.w700
  static final TextStyle bold = GoogleFonts.inter(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.bold,
    color: Blue.primary,
  );

  /// FontWeight.w800
  static final TextStyle extraBold = GoogleFonts.inter(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.extraBold,
    color: Blue.primary,
  );

  /// FontWeight.w900
  static final TextStyle black = GoogleFonts.inter(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.black,
    color: Blue.primary,
  );
}

// ignore: avoid_classes_with_only_static_members
class ButtonTextStyle {
  /// FontWeight.w300
  static final TextStyle light = GoogleFonts.poppins(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.light,
    color: AppColors.white,
  );

  /// FontWeight.w500
  static final TextStyle medium = GoogleFonts.poppins(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.medium,
    color: Blue.tertiary,
  );
}

// ignore: avoid_classes_with_only_static_members
class TextFieldTextStyle {
  /// FontWeight.w700
  static final TextStyle bold = GoogleFonts.urbanist(
    fontSize: AppFontSize.extraLarge,
    fontWeight: AppFontWeight.bold,
    color: AppColors.white,
  );
}
