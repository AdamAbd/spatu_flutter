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

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary(
    String label, {
    Key? key,
    required Function() onPressed,
    bool isButtonDisabled = false,
    FontWeight fontWeight = AppFontWeight.bold,
    Color buttonColor = Blue.secondary,
    Color labelColor = AppColors.white,
    Color borderColor = Colors.transparent,
    double borderWidth = 1,
    double borderRadius = AppBorderRadius.small,
    double fontSize = AppFontSize.normal,
    double paddingVertical = 0,
    double paddingHorizontal = AppGap.normal,
    double? height,
    double? width,
  })  : _label = label,
        _onPressed = onPressed,
        _fontWeight = fontWeight,
        _buttonColor = buttonColor,
        _labelColor = labelColor,
        _isButtonDisabled = isButtonDisabled,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        _fontSize = fontSize,
        _paddingVertical = paddingVertical,
        _paddingHorizontal = paddingHorizontal,
        _height = height,
        _width = width,
        super(key: key);

  final String _label;
  final Function() _onPressed;
  final FontWeight _fontWeight;
  final Color _buttonColor;
  final Color? _labelColor;
  final Color _borderColor;
  final double _borderWidth;
  final bool _isButtonDisabled;
  final double _borderRadius;
  final double _fontSize;
  final double _paddingVertical;
  final double _paddingHorizontal;
  final double? _height;
  final double? _width;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);

    if (Platform.isAndroid) {
      return SizedBox(
        height: _height ??
            _responsive.getResponsiveSize(
              AppButtonSize.normal,
            ),
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
          child: Text(
            _label.toUpperCase(),
            style: TextStyle(
              fontSize: _responsive.getResponsiveFontSize(
                _fontSize,
              ),
              color: _labelColor,
              fontWeight: _fontWeight,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    } else {
      return Container(
        height: _height ??
            _responsive.getResponsiveSize(
              AppButtonSize.normal,
            ),
        width: _width,
        decoration: BoxDecoration(
          border: Border.all(color: _borderColor),
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: CupertinoButton(
          onPressed: _isButtonDisabled ? null : _onPressed,
          color: _buttonColor,
          disabledColor: _buttonColor,
          padding: EdgeInsets.symmetric(
            vertical: _paddingVertical,
            horizontal: _paddingHorizontal,
          ),
          pressedOpacity: 0.8,
          borderRadius: BorderRadius.circular(_borderRadius),
          child: Text(
            _label.toUpperCase(),
            style: TextStyle(
              fontSize: _responsive.getResponsiveFontSize(
                _fontSize,
              ),
              color: _labelColor,
              fontWeight: _fontWeight,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
  }
}

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

// class ButtonPrimaryWithIcon extends StatelessWidget {
//   const ButtonPrimaryWithIcon(
//     String label, {
//     Key? key,
//     required VoidCallback onPressed,
//     required Widget icon,
//     double height = AppButtonSize.normal,
//     double? width,
//     double paddingVertical = 0,
//     double paddingHorizontal = AppGap.extraLarge,
//     bool isCenterLabel = true,
//     FontWeight fontWeight = AppFontWeight.semiBold,
//     Color buttonColor = Blue.secondary,
//     Color labelColor = AppColors.white,
//     bool isButtonDisabled = false,
//     Color borderColor = Colors.transparent,
//     double borderRadius = AppBorderRadius.extraSmall,
//     double fontSize = AppFontSize.normal,
//   })  : _label = label,
//         _onPressed = onPressed,
//         _icon = icon,
//         _height = height,
//         _width = width,
//         _paddingVertical = paddingVertical,
//         _paddingHorizontal = paddingHorizontal,
//         _isCenterLabel = isCenterLabel,
//         _fontWeight = fontWeight,
//         _buttonColor = buttonColor,
//         _labelColor = labelColor,
//         _isButtonDisabled = isButtonDisabled,
//         _borderColor = borderColor,
//         _borderRadius = borderRadius,
//         _fontSize = fontSize,
//         super(key: key);

//   final String _label;
//   final VoidCallback _onPressed;
//   final Widget _icon;
//   final double _height;
//   final double? _width;
//   final double _paddingVertical;
//   final double _paddingHorizontal;
//   final bool _isCenterLabel;
//   final FontWeight _fontWeight;
//   final Color _buttonColor;
//   final Color? _labelColor;
//   final Color _borderColor;
//   final bool _isButtonDisabled;
//   final double _borderRadius;
//   final double _fontSize;

//   @override
//   Widget build(BuildContext context) {
//     final _responsive = ResponsiveUtils(context);

//     if (Platform.isAndroid) {
//       return SizedBox(
//         height: _responsive.getResponsiveSize(_height),
//         width: _width,
//         child: OutlinedButton(
//           onPressed: _isButtonDisabled ? null : _onPressed,
//           style: OutlinedButton.styleFrom(
//             backgroundColor: _buttonColor,
//             padding: EdgeInsets.symmetric(
//               vertical: _paddingVertical,
//               horizontal: _paddingHorizontal,
//             ),
//             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             side: BorderSide(color: _borderColor),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(
//                 _borderRadius,
//               ),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _icon,
//               const Gap(),
//               Text(
//                 _label.toUpperCase(),
//                 style: TextStyle(
//                   fontSize: _responsive.getResponsiveFontSize(
//                     _fontSize,
//                   ),
//                   color: _labelColor,
//                   fontWeight: _fontWeight,
//                 ),
//                 textAlign: _isCenterLabel ? TextAlign.center : TextAlign.start,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Container(
//         height: _responsive.getResponsiveSize(_height),
//         width: _width,
//         decoration: BoxDecoration(
//           border: Border.all(color: _borderColor),
//           borderRadius: BorderRadius.circular(_borderRadius),
//         ),
//         child: CupertinoButton(
//           onPressed: _isButtonDisabled ? null : _onPressed,
//           color: _buttonColor,
//           disabledColor: _buttonColor,
//           padding: EdgeInsets.symmetric(
//             vertical: _paddingVertical,
//             horizontal: _paddingHorizontal,
//           ),
//           pressedOpacity: 0.8,
//           borderRadius: BorderRadius.circular(_borderRadius),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _icon,
//               const Gap(),
//               Text(
//                 _label.toUpperCase(),
//                 style: TextStyle(
//                   fontSize: _responsive.getResponsiveFontSize(
//                     _fontSize,
//                   ),
//                   color: _labelColor,
//                   fontWeight: _fontWeight,
//                 ),
//                 textAlign: _isCenterLabel ? TextAlign.center : TextAlign.start,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }

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
