import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as context;
import 'package:lottie/lottie.dart';
import 'package:spatu_flutter/feature/feature.dart';

extension CustomDialog on context.BuildContext {
  void previewImage({
    Key? key,
    File? file,
    String imagePath = "",
    bool isNetwork = false,
  }) {
    showDialog(
      context: this,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.w32,
                vertical: AppSize.w8,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: ButtonPrimary(
                  'halo',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  // icon: Icons.close_rounded,
                  // iconColor: AppColors.black,
                  // backgroundColor: AppColors.white,
                  // iconSize: 18,
                ),
                // child: ButtonIcon(
                //   onTap: () => Navigator.pop(context),
                //   child: const Icon(
                //     Icons.close_rounded,
                //     size: 18,
                //     color: AppColors.black,
                //   ),
                //   backgroundColor: AppColors.white,
                // ),
              ),
            ),
            Dialog(
              backgroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.w8),
              ),
              insetPadding: const EdgeInsets.symmetric(
                horizontal: AppSize.w32,
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  AppSize.w12,
                ),
                child: InteractiveViewer(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.w8),
                    child: Visibility(
                      visible: isNetwork,
                      replacement: Image.file(
                        file ?? File(""),
                        fit: BoxFit.cover,
                      ),
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        // errorBuilder: (_, object, trace) {
                        //   return Image.asset(
                        //     AppIllustration.ill404,
                        //     fit: BoxFit.contain,
                        //   );
                        // },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> previewCameraImage({
  //   Key? key,
  //   required File file,
  //   required Function() onTapSave,
  // }) async {
  //   showDialog(
  //     context: this,
  //     builder: (context) => MediaQuery(
  //       data: MediaQuery.of(context).copyWith(
  //         textScaleFactor: 1,
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(
  //               horizontal: AppSize.w32,
  //               vertical: AppSize.w8,
  //             ),
  //             child: Align(
  //               alignment: Alignment.centerRight,
  //               child: ButtonIcon(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 icon: Icons.close_rounded,
  //                 iconColor: AppColors.black,
  //                 backgroundColor: AppColors.white,
  //                 iconSize: 18,
  //               ),
  //             ),
  //           ),
  //           Dialog(
  //             backgroundColor: AppColors.white,
  //             elevation: 0,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(AppSize.w8),
  //             ),
  //             insetPadding: const EdgeInsets.symmetric(
  //               horizontal: AppSize.w32,
  //             ),
  //             child: SingleChildScrollView(
  //               child: Padding(
  //                 padding: const EdgeInsets.all(
  //                   AppSize.w12,
  //                 ),
  //                 child: Stack(
  //                   children: [
  //                     InteractiveViewer(
  //                       child: ClipRRect(
  //                         borderRadius:
  //                             BorderRadius.circular(AppSize.w8),
  //                         child: Image.file(
  //                           file,
  //                           width: MediaQuery.of(context).size.width *
  //                               (MediaQuery.of(context).orientation ==
  //                                       Orientation.portrait
  //                                   ? 1
  //                                   : 0.5),
  //                           height: MediaQuery.of(context).size.height * 0.5,
  //                           fit: BoxFit.contain,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Container(
  //             width: MediaQuery.of(context).size.width *
  //                 (MediaQuery.of(context).orientation == Orientation.portrait
  //                     ? 1
  //                     : 0.5),
  //             padding: EdgeInsets.symmetric(
  //               horizontal:
  //                   MediaQuery.of(context).orientation == Orientation.portrait
  //                       ? AppSize.w32
  //                       : 0,
  //               vertical: AppSize.w8,
  //             ),
  //             child: ButtonPrimary(
  //               buttonColor: AppColors.purple,
  //               buttonTextColor: AppColors.white,
  //               buttonText: "Use This Photo",
  //               onPressed: onTapSave,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void successDialog({
    Key? key,
    required String messageBody,
    String buttonText = 'Ok',
    Function()? onTap,
  }) {
    final _theme = Theme.of(this);
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Dialog(
          backgroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.w8),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.w32,
          ),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppLottie.checkmark,
                  height: AppSize.w96,
                  fit: BoxFit.fitWidth,
                  repeat: true,
                  animate: true,
                ),
                const Gap(),
                Text(
                  messageBody,
                  textAlign: TextAlign.center,
                  style: _theme.textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: _theme.textTheme.subtitle1!.fontSize,
                  ),
                ),
                const Gap(height: AppSize.w16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.w16,
                  ),
                  child: ButtonPrimary(
                    buttonText,
                    onPressed: () {
                      Navigator.pop(this);
                      onTap?.call();
                    },
                    buttonColor: _theme.primaryColor,
                    labelColor: AppColors.white,
                  ),
                ),
                const Gap(height: AppSize.w16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void errorDialog({
    Key? key,
    required String messageBody,
    String buttonText = 'Close',
    Function()? onTap,
  }) {
    final _theme = Theme.of(this);
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Dialog(
          backgroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.w8),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.w32,
          ),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppSize.w96 * 1.1,
                  child: Lottie.asset(
                    AppLottie.fail,
                    height: AppSize.w96,
                    fit: BoxFit.fitWidth,
                    repeat: true,
                    animate: true,
                  ),
                ),
                const Gap(),
                Text(
                  messageBody,
                  textAlign: TextAlign.center,
                  style: _theme.textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: _theme.textTheme.subtitle1!.fontSize,
                  ),
                ),
                const Gap(height: AppSize.w16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.w16,
                  ),
                  child: ButtonPrimary(
                    buttonText,
                    onPressed: () {
                      Navigator.pop(this);
                      onTap?.call();
                    },
                    buttonColor: _theme.primaryColor,
                    labelColor: AppColors.white,
                  ),
                ),
                const Gap(height: AppSize.w16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirmationDialog({
    Key? key,
    required String title,
    required String messageBody,
    required String positiveButtonText,
    required String negativeButtonText,
    required Function() positiveButtonAction,
    required Function() negativeButtonAction,
  }) {
    final _theme = Theme.of(this);
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Dialog(
          backgroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.w8),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.w32,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.w16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(
                  height: AppSize.w16,
                ),
                Icon(
                  Icons.info_rounded,
                  color: _theme.primaryColor,
                  size: 72,
                ),
                const Gap(
                  height: AppSize.w16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.w16,
                  ),
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: _theme.textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: _theme.textTheme.headline5!.fontSize,
                        ),
                      ),
                      const Gap(
                        height: AppSize.w16 / 2,
                      ),
                      Text(
                        messageBody,
                        textAlign: TextAlign.center,
                        style: _theme.textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: _theme.textTheme.subtitle1!.fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(
                  height: AppSize.w16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.w16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ButtonPrimary(
                          negativeButtonText,
                          buttonColor: AppColors.green,
                          labelColor: AppColors.white,
                          onPressed: negativeButtonAction,
                        ),
                      ),
                      const Gap(
                        width: AppSize.w16 / 2,
                      ),
                      Expanded(
                        child: ButtonPrimary(
                          positiveButtonText,
                          buttonColor: _theme.primaryColor,
                          labelColor: AppColors.white,
                          onPressed: positiveButtonAction,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(
                  height: AppSize.w16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadingDialog({
    Key? key,
  }) {
    final _theme = Theme.of(this);
    final _responsive = ResponsiveUtils(this);
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1,
        ),
        child: Dialog(
          backgroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.w8),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.w32,
          ),
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Loading...",
                  style: AppTextStyle.semiBold.copyWith(
                    color: AppColors.black,
                    fontSize: _responsive.getResponsiveFontSize(AppSize.w24),
                  ),
                ),
                SizedBox(
                  width: _responsive.getResponsiveSize(
                    AppSize.w96 * 1.5,
                  ),
                  child: Lottie.asset(
                    AppLottie.loading,
                    height: _responsive.getResponsiveSize(
                      AppSize.w96 * 1.2,
                    ),
                    fit: BoxFit.fitWidth,
                    repeat: true,
                    animate: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
