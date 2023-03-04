import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:spatu_flutter/feature/common/utils/utils.dart';

class Hyperlink extends StatelessWidget {
  const Hyperlink(
    String label, {
    Key? key,
    required Function() onTap,
    Color labelColor = Blue.secondary,
    FontWeight fontWeight = AppFontWeight.bold,
    bool isUnderlined = false,
    bool isItalic = false,
    double fontSize = AppSize.w14,
  })  : _onTap = onTap,
        _label = label,
        _labelColor = labelColor,
        _fontWeight = fontWeight,
        _isUnderlined = isUnderlined,
        _isItalic = isItalic,
        _fontSize = fontSize,
        super(key: key);

  final Function() _onTap;
  final String _label;
  final Color _labelColor;
  final FontWeight _fontWeight;
  final bool _isUnderlined;
  final bool _isItalic;
  final double _fontSize;

  @override
  Widget build(BuildContext context) {
    final _responsive = ResponsiveUtils(context);
    // if (Platform.isAndroid) {
    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        height: _responsive.getResponsiveSize(
          AppSize.w32,
        ),
        // padding: const EdgeInsets.symmetric(
        //   vertical: AppSize.w4,
        //   horizontal: AppSize.w8,
        // ),
        child: Text(
          _label,
          textAlign: TextAlign.center,
          style: AppTextStyle.regular.copyWith(
            color: Yellow.primary,
          ),
        ),
      ),
    );
    // } else {
    //   return SizedBox(
    //     height: _responsive.getResponsiveSize(
    //       AppSize.w32,
    //     ),
    //     child: CupertinoButton(
    //       padding: EdgeInsets.zero,
    //       onPressed: _onTap,
    //       child: Text(
    //         _label,
    //         style: TextStyle(
    //           color: _labelColor,
    //           fontSize: _responsive.getResponsiveFontSize(
    //             _fontSize,
    //           ),
    //           fontWeight: _fontWeight,
    //           decoration: _isUnderlined
    //               ? TextDecoration.underline
    //               : TextDecoration.none,
    //           fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
    //           decorationColor: _labelColor,
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}

// class IconWithText extends StatelessWidget {
//   const IconWithText({
//     Key? key,
//     required String icon,
//     required String text,
//   })  : _icon = icon,
//         _text = text,
//         super(key: key);

//   final String _icon;
//   final String _text;

//   @override
//   Widget build(BuildContext context) {
//     final _responsive = ResponsiveUtils(context);
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: _responsive.getResponsiveSize(
//             AppIconSize.extraSmall,
//           ),
//           height: _responsive.getResponsiveSize(
//             AppIconSize.extraSmall,
//           ),
//           child: SvgPicture.asset(
//             _icon,
//             width: _responsive.getResponsiveSize(
//               AppIconSize.extraSmall,
//             ),
//             height: _responsive.getResponsiveSize(
//               AppIconSize.extraSmall,
//             ),
//             color: Black.primary,
//           ),
//         ),
//         const Gap(
//           width: AppSize.w12,
//         ),
//         Expanded(
//           child: Text(
//             _text.trim().toUpperCase(),
//             style: AppTextStyle.medium.copyWith(
//               fontSize: _responsive.getResponsiveSize(
//                 AppSize.w14,
//               ),
//             ),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }
