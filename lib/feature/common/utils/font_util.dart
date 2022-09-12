import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils.dart';

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
  static final TextStyle light = GoogleFonts.roboto(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.light,
    color: Black.primary,
  );

  /// FontWeight.w400
  static final TextStyle regular = GoogleFonts.roboto(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.regular,
    color: Black.primary,
  );

  /// FontWeight.w500
  static final TextStyle medium = GoogleFonts.roboto(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.medium,
    color: Black.primary,
  );

  /// FontWeight.w600
  static final TextStyle semiBold = GoogleFonts.roboto(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.semiBold,
    color: Black.primary,
  );

  /// FontWeight.w700
  static final TextStyle bold = GoogleFonts.roboto(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.bold,
    color: Black.primary,
  );

  /// FontWeight.w800
  static final TextStyle extraBold = GoogleFonts.roboto(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.extraBold,
    color: Black.primary,
  );

  /// FontWeight.w900
  static final TextStyle black = GoogleFonts.roboto(
    fontSize: AppFontSize.normal,
    fontWeight: AppFontWeight.black,
    color: Black.primary,
  );
}
