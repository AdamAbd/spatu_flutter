import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class CustomScrollViewWrapper extends StatelessWidget {
  const CustomScrollViewWrapper({
    super.key,
    required List<Widget> slivers,
    Function()? onTap,
    ScrollPhysics physic = const ClampingScrollPhysics(),
  })  : _slivers = slivers,
        _onTap = onTap,
        _physic = physic;

  final List<Widget> _slivers;
  final Function()? _onTap;
  final ScrollPhysics _physic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusUtils(context).unfocus();
        if (_onTap != null) {
          _onTap;
        }
      },
      child: CustomScrollView(
        physics: _physic,
        slivers: _slivers,
      ),
    );
  }
}
