import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required TextFieldEntity textField,
  }) : _textField = textField;

  final TextFieldEntity _textField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSize.w24,
        top: AppSize.w20,
        right: AppSize.w8,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchTextField(
              textFieldEntity: _textField,
              onChanged: (p0) {},
              onEditingComplete: () {},
            ),
          ),
          ButtonIcon(
            onTap: () {},
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.w16,
            ),
            child: SvgPicture.asset(
              AppIcon.buy,
              width: AppSize.w24,
            ),
          ),
        ],
      ),
    );
  }
}
