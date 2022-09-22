import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    Key? key,
    required VoidCallback onTap,
    required Widget child,
    Color backgroundColor = Colors.transparent,
    bool isDarkSplash = false,
    bool isCircle = false,
    Color? splashColor,
    Color? highlightColor,
    double? buttonSize,
    double radius = AppBorderRadius.extraSmall,
    EdgeInsetsGeometry? padding,
    double? borderThickness,
    Color? borderColor,
  })  : _onTap = onTap,
        _child = child,
        _backgroundColor = backgroundColor,
        _isDarkSplash = isDarkSplash,
        _splashColor = splashColor,
        _highlightColor = highlightColor,
        _buttonSize = buttonSize,
        _radius = radius,
        _padding = padding,
        _borderThickness = borderThickness,
        _borderColor = borderColor,
        super(key: key);

  final VoidCallback _onTap;
  final Widget _child;
  final Color _backgroundColor;
  final bool _isDarkSplash;
  final Color? _splashColor;
  final Color? _highlightColor;
  final double? _buttonSize;
  final double _radius;
  final EdgeInsetsGeometry? _padding;
  final double? _borderThickness;
  final Color? _borderColor;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    if (Platform.isAndroid) {
      return Card(
        color: _backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
          side: _borderThickness != null
              ? BorderSide(
                  color: _borderColor ?? Colors.white,
                  width: _borderThickness ?? 1,
                )
              : BorderSide.none,
        ),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        elevation: 0,
        child: InkWell(
          onTap: _onTap,
          splashColor:
              (_splashColor ?? (_isDarkSplash ? Colors.black : Colors.white))
                  .withOpacity(.2),
          highlightColor:
              (_highlightColor ?? (_isDarkSplash ? Colors.black : Colors.white))
                  .withOpacity(.2),
          child: Container(
            constraints: BoxConstraints(
              minWidth: _responsive
                  .getResponsiveSize(_buttonSize ?? AppButtonSize.normal),
              minHeight: _responsive
                  .getResponsiveSize(_buttonSize ?? AppButtonSize.normal),
            ),
            padding: _padding ??
                (_buttonSize == null
                    ? const EdgeInsets.all(AppGap.extraSmall)
                    : EdgeInsets.zero),
            alignment: Alignment.center,
            child: _child,
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          border: _borderThickness != null
              ? Border.all(
                  color: _borderColor ?? Colors.white,
                  width: _borderThickness ?? 1,
                )
              : null,
        ),
        child: CupertinoButton(
          minSize: AppButtonSize.normal,
          color: _backgroundColor,
          disabledColor: _backgroundColor,
          borderRadius: BorderRadius.circular(_radius),
          padding: _padding ??
              (_buttonSize == null
                  ? const EdgeInsets.all(AppGap.extraSmall)
                  : EdgeInsets.zero),
          onPressed: _onTap,
          child: _child,
        ),
      );
    }
  }
}

// class ButtonPrimary extends StatelessWidget {
//   const ButtonPrimary(
//     String label, {
//     super.key,
//     required VoidCallback onPressed,
//     double height = AppButtonSize.large,
//     double? width,
//     bool isButtonDisabled = false,
//     Color buttonColor = Yellow.primary,
//     double paddingVertical = 0,
//     double paddingHorizontal = AppGap.normal,
//     Color borderColor = Colors.transparent,
//     double borderWidth = 0,
//     double borderRadius = AppBorderRadius.small,
//     double fontSize = AppFontSize.normal,
//     FontWeight? fontWeight,
//     Color labelColor = Blue.tertiary,
//   })  : _label = label,
//         _onPressed = onPressed,
//         _height = height,
//         _width = width,
//         _isButtonDisabled = isButtonDisabled,
//         _buttonColor = buttonColor,
//         _paddingVertical = paddingVertical,
//         _paddingHorizontal = paddingHorizontal,
//         _borderColor = borderColor,
//         _borderWidth = borderWidth,
//         _borderRadius = borderRadius,
//         _fontWeight = fontWeight,
//         _fontSize = fontSize,
//         _labelColor = labelColor;

//   final String _label;
//   final VoidCallback _onPressed;
//   final double _height;
//   final double? _width;
//   final bool _isButtonDisabled;
//   final Color _buttonColor;
//   final double _paddingVertical;
//   final double _paddingHorizontal;
//   final Color _borderColor;
//   final double _borderWidth;
//   final double _borderRadius;
//   final FontWeight? _fontWeight;
//   final double _fontSize;
//   final Color? _labelColor;

//   @override
//   Widget build(BuildContext context) {
//     final _responsive = ResponsiveUtils(context);

//     return SizedBox(
//       height: _responsive.getResponsiveSize(_height),
//       width: _width,
//       child: OutlinedButton(
//         onPressed: _isButtonDisabled ? null : _onPressed,
//         style: OutlinedButton.styleFrom(
//           backgroundColor: _buttonColor,
//           padding: EdgeInsets.symmetric(
//             vertical: _paddingVertical,
//             horizontal: _paddingHorizontal,
//           ),
//           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           side: BorderSide(color: _borderColor, width: _borderWidth),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(
//               _borderRadius,
//             ),
//           ),
//         ),
//         child: Text(
//           _label,
//           style: ButtonTextStyle.medium.copyWith(
//             fontSize: _responsive.getResponsiveFontSize(
//               _fontSize,
//             ),
//             fontWeight: _fontWeight,
//             color: _labelColor,
//           ),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     );
//   }
// }

// class BottomSheetButtonWithIcon extends StatelessWidget {
//   const BottomSheetButtonWithIcon({
//     Key? key,
//     required String buttonText,
//     required Widget icon,
//     required Function() onTap,
//     required double bottomPadding,
//     bool isDisabled = false,
//   })  : _buttonText = buttonText,
//         _icon = icon,
//         _onTap = onTap,
//         _bottomPadding = bottomPadding,
//         _isDisabled = isDisabled,
//         super(key: key);

//   final String _buttonText;
//   final Widget _icon;
//   final Function() _onTap;
//   final double _bottomPadding;
//   final bool _isDisabled;

//   @override
//   Widget build(BuildContext context) {
//     // final _responsive = ResponsiveUtils(context);
//     return Container(
//       color: AppColors.white,
//       width: double.infinity,
//       padding: EdgeInsets.only(
//         bottom: _bottomPadding,
//         left: AppGap.large,
//         right: AppGap.large,
//         top: AppGap.small,
//       ),
//       child: ButtonPrimaryWithIcon(
//         _buttonText,
//         onPressed: _isDisabled ? () {} : _onTap,
//         buttonColor: _isDisabled ? Grey.primary : Blue.secondary,
//         icon: _icon,
//       ),
//     );
//   }
// }

// class BottomSheetButton extends StatelessWidget {
//   const BottomSheetButton({
//     Key? key,
//     required String buttonText,
//     required Function() onTap,
//     required double bottomPadding,
//   })  : _buttonText = buttonText,
//         _onTap = onTap,
//         _bottomPadding = bottomPadding,
//         super(key: key);

//   final String _buttonText;
//   final Function() _onTap;
//   final double _bottomPadding;

//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context);
//     return Container(
//       color: AppColors.white,
//       width: double.infinity,
//       padding: EdgeInsets.only(
//         bottom: _bottomPadding,
//         left: AppGap.large,
//         right: AppGap.large,
//         top: AppGap.small,
//       ),
//       child: ButtonPrimary(
//         _buttonText,
//         onPressed: _onTap,
//       ),
//     );
//   }
// }

// class ButtonBackCircle extends StatelessWidget {
//   const ButtonBackCircle({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _responsive = ResponsiveUtils(context);
//     return Positioned(
//       top: 0,
//       left: 0,
//       child: Padding(
//         padding: EdgeInsets.only(
//           top: _responsive.getResponsiveSize(
//             AppGap.medium,
//           ),
//           left: _responsive.getResponsiveSize(
//             AppGap.medium,
//           ),
//         ),
//         child: ClipOval(
//           child: ButtonIcon(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             backgroundColor: Blue.secondary,
//             child: SvgPicture.asset(
//               AppBarAssets.arrowBack,
//               color: AppColors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary(
    String label, {
    super.key,
    required VoidCallback onPressed,
    Widget? leading,
    Widget? trailing,
    double height = AppButtonSize.large,
    double? width,
    bool isButtonDisabled = false,
    Color buttonColor = Yellow.primary,
    double paddingVertical = 0,
    double paddingHorizontal = AppGap.extraLarge,
    Color borderColor = Colors.transparent,
    double borderWidth = 0,
    double borderRadius = AppBorderRadius.extraSmall,
    FontWeight fontWeight = AppFontWeight.semiBold,
    Color labelColor = Blue.tertiary,
    double fontSize = AppFontSize.normal,
    bool isLoading = false,
  })  : _label = label,
        _onPressed = onPressed,
        _leading = leading,
        _trailing = trailing,
        _height = height,
        _width = width,
        _isButtonDisabled = isButtonDisabled,
        _buttonColor = buttonColor,
        _paddingVertical = paddingVertical,
        _paddingHorizontal = paddingHorizontal,
        _fontWeight = fontWeight,
        _labelColor = labelColor,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        _fontSize = fontSize,
        _isLoading = isLoading;

  final String _label;
  final VoidCallback _onPressed;
  final Widget? _leading;
  final Widget? _trailing;
  final double _height;
  final double? _width;
  final bool _isButtonDisabled;
  final Color _buttonColor;
  final double _paddingVertical;
  final double _paddingHorizontal;
  final Color _borderColor;
  final double _borderWidth;
  final double _borderRadius;
  final double _fontSize;
  final FontWeight _fontWeight;
  final Color? _labelColor;
  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    return SizedBox(
      height: _responsive.getResponsiveSize(_height),
      width: _width,
      child: OutlinedButton(
        onPressed: _isButtonDisabled ? null : _onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _buttonColor,
          padding: EdgeInsets.symmetric(
            vertical: _paddingVertical,
            horizontal: _paddingHorizontal,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: _borderColor, width: _borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              _borderRadius,
            ),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                height: AppGap.big,
                width: AppGap.big,
                child: CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _leading ?? const SizedBox(),
                  Gap(width: _leading == null ? 0 : AppGap.small),
                  Text(
                    _label,
                    style: ButtonTextStyle.medium.copyWith(
                      fontSize: _responsive.getResponsiveFontSize(_fontSize),
                      fontWeight: _fontWeight,
                      color: _labelColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(width: _trailing == null ? 0 : AppGap.small),
                  _trailing ?? const SizedBox(),
                ],
              ),
      ),
    );
  }
}

// class ButtonAttachment extends StatelessWidget {
//   const ButtonAttachment({
//     Key? key,
//     String buttonText = "Unggah Lampiran",
//     required Function() onPressed,
//     IconData iconData = Icons.attach_file_rounded,
//   })  : _buttonText = buttonText,
//         _onPressed = onPressed,
//         _iconData = iconData,
//         super(key: key);

//   final String _buttonText;
//   final Function() _onPressed;
//   final IconData _iconData;

//   @override
//   Widget build(BuildContext context) {
//     final _responsive = ResponsiveUtils(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Lampiran".toUpperCase(),
//           style: AppTextStyle.semiBold.copyWith(),
//         ),
//         const Gap(),
//         SizedBox(
//           width: double.infinity,
//           child: ButtonPrimaryWithIcon(
//             _buttonText,
//             onPressed: _onPressed,
//             icon: Icon(
//               _iconData,
//               size: _responsive.getResponsiveSize(
//                 AppIconSize.medium,
//               ),
//               color: AppColors.white,
//             ),
//           ),
//         ),
//         const Gap(),
//         Text(
//           "* Lampiran bersifat opsional".toUpperCase(),
//           style: AppTextStyle.regular.copyWith(
//             fontSize: _responsive.getResponsiveSize(
//               AppFontSize.extraSmall,
//             ),
//             color: Grey.primary,
//           ),
//         ),
//       ],
//     );
//   }
// }
