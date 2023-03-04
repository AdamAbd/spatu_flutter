import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(height: AppSize.w24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.medium.copyWith(
                fontSize: AppSize.w16,
              ),
            ),
            Hyperlink(
              "See All",
              onTap: onTap,
              fontWeight: AppFontWeight.light,
              labelColor: AppColors.white,
            ),
          ],
        ),
        const Gap(height: AppSize.w16),
      ],
    );
  }
}
