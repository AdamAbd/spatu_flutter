import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  Color backgroundColor = AppColors.background,
}) {
  final _responsive = ResponsiveUtils(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: ButtonTextStyle.medium.copyWith(
          fontSize: _responsive.getResponsiveFontSize(
            AppFontSize.normal,
          ),
          fontWeight: AppFontWeight.semiBold,
          color: AppColors.white,
        ),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
