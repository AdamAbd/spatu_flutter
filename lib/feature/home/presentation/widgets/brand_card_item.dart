import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class BrandCardItem extends StatelessWidget {
  const BrandCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppSize.w64,
          height: AppSize.w64,
          decoration: const BoxDecoration(
            color: Black.secondary,
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.w6),
            ),
          ),
        ),
        const Gap(height: AppSize.w12),
        Text(
          "Adidas",
          style: AppTextStyle.regular,
        ),
      ],
    );
  }
}
