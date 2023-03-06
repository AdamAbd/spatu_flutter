import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class CustomSliverSearchBar extends StatelessWidget {
  const CustomSliverSearchBar({
    super.key,
    required TextFieldEntity textField,
  }) : _textField = textField;

  final TextFieldEntity _textField;

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
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: AppSize.w80,
      pinned: true,
      title: Padding(
        padding: const EdgeInsets.only(left: AppSize.w24),
        child: Text(
          title,
          style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
        ),
      ),
      centerTitle: false,
      bottom: const PreferredSize(
        preferredSize: Size.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.w24),
          child: Divider(
            height: AppSize.w0,
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
            child: SvgPicture.asset(
              AppIcon.setting,
              width: AppSize.w24,
            ),
          ),
        ),
      ],
    );
  }
}
