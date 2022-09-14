import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spatu_flutter/feature/common/utils/utils.dart';

class SpatuTheme {
  ThemeData of(BuildContext context) {
    final _theme = Theme.of(context);
    return _theme.copyWith(
      primaryColor: Blue.secondary,
      scaffoldBackgroundColor: Black.primary,
      shadowColor: Grey.secondary,
      errorColor: Red.primary,
      disabledColor: Grey.primary,
      textSelectionTheme: _theme.textSelectionTheme.copyWith(
        cursorColor: Blue.primary,
        selectionHandleColor: Blue.primary,
        selectionColor: Blue.quaternary,
      ),
      colorScheme: _theme.colorScheme.copyWith(
        primary: Blue.primary,
        secondary: Blue.secondary,
      ),
      iconTheme: _theme.iconTheme.copyWith(
        color: Blue.secondary,
      ),
      floatingActionButtonTheme: _theme.floatingActionButtonTheme.copyWith(
        backgroundColor: Yellow.primary,
      ),
      appBarTheme: _theme.appBarTheme.copyWith(
        backgroundColor: AppColors.white,
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: _theme.cardTheme.copyWith(
        shadowColor: AppColors.background,
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.small,
          ),
        ),
      ),
      tabBarTheme: _theme.tabBarTheme.copyWith(
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Blue.secondary,
            width: 4,
          ),
        ),
      ),
      bottomNavigationBarTheme: _theme.bottomNavigationBarTheme.copyWith(
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme: _theme.dividerTheme.copyWith(
        color: Blue.primary,
      ),
      inputDecorationTheme: _theme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: Grey.secondary,
        isDense: true,
        hintStyle: AppTextStyle.light.copyWith(
          fontSize: AppFontSize.normal,
          color: TextFieldColors.text,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppGap.extraLarge - 2,
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.enabledBorder,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.enabledBorder,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.enabledBorder,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.errorBorder,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: TextFieldColors.errorBorder,
          ),
        ),
      ),
      splashColor: Platform.isAndroid
          ? Blue.secondary.withOpacity(0.1)
          : Colors.transparent,
      highlightColor: Platform.isAndroid
          ? Colors.transparent
          : Blue.secondary.withOpacity(0.1),
      textTheme: _theme.textTheme.copyWith().apply(
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
    );
  }
}
