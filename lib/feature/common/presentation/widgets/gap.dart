import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class SliverGap extends StatelessWidget {
  const SliverGap({
    Key? key,
    double? height = AppSize.w8,
    double? width = AppSize.w8,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double? _height;
  final double? _width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: _height,
        width: _width,
      ),
    );
  }
}

class Gap extends StatelessWidget {
  const Gap({
    Key? key,
    double height = AppSize.w8,
    double width = AppSize.w8,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
    );
  }
}

class SliverBottomSafeArea extends StatelessWidget {
  const SliverBottomSafeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).viewPadding.bottom,
      ),
    );
  }
}

class SliverTopSafeArea extends StatelessWidget {
  const SliverTopSafeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).viewPadding.top,
      ),
    );
  }
}

class BottomSafeArea extends StatelessWidget {
  const BottomSafeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).viewPadding.bottom,
    );
  }
}

class TopSafeArea extends StatelessWidget {
  const TopSafeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).viewPadding.top,
    );
  }
}
