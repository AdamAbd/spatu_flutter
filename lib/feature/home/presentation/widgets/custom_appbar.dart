import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class SliverSearchBar extends StatelessWidget {
  const SliverSearchBar({
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
          margin: const EdgeInsets.symmetric(vertical: AppSize.w16),
          child: ButtonIcon(
            onTap: () {},
            padding: const EdgeInsets.only(
              left: AppSize.w16,
              right: AppSize.w24,
            ),
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
