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
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.light,
    color: AppColors.white,
  );

  /// FontWeight.w400
  static final TextStyle regular = GoogleFonts.inter(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.regular,
    color: AppColors.white,
  );

  /// FontWeight.w500
  static final TextStyle medium = GoogleFonts.inter(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.medium,
    color: AppColors.white,
  );

  /// FontWeight.w600
  static final TextStyle semiBold = GoogleFonts.inter(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.white,
  );

  /// FontWeight.w700
  static final TextStyle bold = GoogleFonts.inter(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.bold,
    color: AppColors.white,
  );

  /// FontWeight.w800
  static final TextStyle extraBold = GoogleFonts.inter(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.extraBold,
    color: AppColors.white,
  );

  /// FontWeight.w900
  static final TextStyle black = GoogleFonts.inter(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.black,
    color: AppColors.white,
  );
}

// ignore: avoid_classes_with_only_static_members
class ButtonTextStyle {
  /// FontWeight.w300
  static final TextStyle light = GoogleFonts.poppins(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.light,
    color: AppColors.white,
  );

  /// FontWeight.w500
  static final TextStyle medium = GoogleFonts.poppins(
    fontSize: AppSize.w14,
    fontWeight: AppFontWeight.medium,
    color: Blue.tertiary,
  );
}

// ignore: avoid_classes_with_only_static_members
class TextFieldTextStyle {
  /// FontWeight.w700
  static final TextStyle bold = GoogleFonts.urbanist(
    fontSize: AppSize.w20,
    fontWeight: AppFontWeight.bold,
    color: AppColors.white,
  );
}
