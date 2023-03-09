import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class CustomSliverSearchBar extends StatelessWidget {
  const CustomSliverSearchBar({
    super.key,
    required TextFieldEntity textField,
    PreferredSizeWidget? bottom,
  })  : _textField = textField,
        _bottom = bottom;

  final TextFieldEntity _textField;
  final PreferredSizeWidget? _bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: AppSize.w80,
      pinned: true,
      title: Padding(
        padding: const EdgeInsets.only(left: AppSize.w24),
        child: CustomSearchTextField(
          textFieldEntity: _textField,
          onChanged: (p0) {},
          onEditingComplete: () {},
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(
            top: AppSize.w16,
            bottom: AppSize.w16,
            right: AppSize.w8,
          ),
          child: ButtonIcon(
            onTap: () {},
            padding: const EdgeInsets.symmetric(horizontal: AppSize.w16),
            child: SvgPicture.asset(
              AppIcon.buy,
              width: AppSize.w24,
            ),
          ),
        ),
      ],
      bottom: _bottom,
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required String title,
    required String icon,
    bool isDivideBottom = false,
  })  : _title = title,
        _icon = icon,
        _isDivideBottom = isDivideBottom;

  final String _title;
  final String _icon;
  final bool _isDivideBottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: AppSize.w80,
      pinned: true,
      title: Padding(
        padding: const EdgeInsets.only(left: AppSize.w24),
        child: Text(
          _title,
          style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
        ),
      ),
      centerTitle: false,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.w24),
          child: Visibility(
            visible: _isDivideBottom,
            child: const Divider(
              height: AppSize.w0,
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(
            top: AppSize.w16,
            bottom: AppSize.w16,
            right: AppSize.w8,
          ),
          child: ButtonIcon(
            onTap: () {},
            padding: const EdgeInsets.symmetric(horizontal: AppSize.w16),
            child: SvgPicture.asset(_icon, width: AppSize.w24),
          ),
        ),
      ],
    );
  }
}
