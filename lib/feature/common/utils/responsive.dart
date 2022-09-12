import 'dart:io';

import 'package:flutter/material.dart';

import 'size.dart';

class ResponsiveUtils {
  final BuildContext context;

  const ResponsiveUtils(
    this.context,
  );

  // Media Size
  Size _getMediaQuerySize() => MediaQuery.of(context).size;
  double getMediaQueryHeight() => _getMediaQuerySize().height;
  double getMediaQueryWidth() => _getMediaQuerySize().width;

  // Information Device
  bool _isSmallMobileSize() => getMediaQueryWidth() <= 375;
  bool _isNormalMobileSize() =>
      getMediaQueryWidth() > 375 && getMediaQueryWidth() <= 480;
  bool _isTabletSize() =>
      getMediaQueryWidth() > 480 && getMediaQueryWidth() <= 768;

  // Font Size
  double getResponsiveFontSize(
    double normal, {
    double? small,
    double? tablet,
  }) {
    if (_isSmallMobileSize()) {
      return normal - 1;
    }
    if (_isNormalMobileSize()) {
      return normal;
    }
    if (_isTabletSize()) {
      return normal + 1;
    }
    return 0;
  }

  // Bottom & Top View Padding
  EdgeInsets getMediaQueryPadding() => MediaQuery.of(context).viewPadding;

  double getMediaQueryPaddingBottom() => getMediaQueryPadding().bottom;
  double getMediaQueryPaddingTop() => getMediaQueryPadding().top;

  bool isHavePaddingBottom() => getMediaQueryPadding().bottom != 0;
  bool isHavePaddingTop() => getMediaQueryPadding().top != 0;

  double getResponsiveBottomPadding() {
    if (Platform.isIOS) {
      return AppGap.big;
    } else {
      return getMediaQueryPaddingBottom() +
          (isHavePaddingBottom() ? AppGap.medium : AppGap.large);
    }
  }

  double getResponsivePaddingTop() {
    return getMediaQueryPaddingTop() +
        kToolbarHeight +
        (isHavePaddingTop() ? AppGap.medium : AppGap.large);
  }

  // Padding
  double getResponsivePadding(
    double normal, {
    double? small,
    double? tablet,
  }) {
    if (_isSmallMobileSize()) {
      return small ?? normal;
    }
    if (_isNormalMobileSize()) {
      return normal;
    }
    if (_isTabletSize()) {
      return tablet ?? normal;
    }
    return 0;
  }

  double getResponsiveHorizontalPadding(
    double normal, {
    double? small,
    double? tablet,
  }) {
    if (_isSmallMobileSize()) {
      return small ?? normal;
    }
    if (_isNormalMobileSize()) {
      return normal;
    }
    if (_isTabletSize()) {
      return tablet ?? normal;
    }
    return 0;
  }

  // icon size
  double getResponsiveIconSize(
    double normal, {
    double? small,
    double? tablet,
  }) {
    if (_isSmallMobileSize()) {
      return small ?? normal;
    }
    if (_isNormalMobileSize()) {
      return normal;
    }
    if (_isTabletSize()) {
      return tablet ?? normal;
    }
    return 0;
  }

  // logo size
  double getResponsiveLogoSize(
    double normal, {
    double? small,
    double? tablet,
  }) {
    if (_isSmallMobileSize()) {
      return small ?? normal;
    }
    if (_isNormalMobileSize()) {
      return normal;
    }
    if (_isTabletSize()) {
      return tablet ?? normal;
    }
    return 0;
  }

  //positioned
  double getResponsivePosition(
    double normal, {
    double? small,
    double? tablet,
  }) {
    if (_isSmallMobileSize()) {
      return small ?? normal;
    }
    if (_isNormalMobileSize()) {
      return normal;
    }
    if (_isTabletSize()) {
      return tablet ?? normal;
    }
    return 0;
  }

  //size
  double getResponsiveSize(
    double normal, {
    double? small,
    double? tablet,
  }) {
    if (_isSmallMobileSize()) {
      return small ?? normal;
    }
    if (_isNormalMobileSize()) {
      return normal;
    }
    if (_isTabletSize()) {
      return tablet ?? normal;
    }
    return 0;
  }
}
