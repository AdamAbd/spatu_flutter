import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class ProductItemGrid extends StatelessWidget {
  const ProductItemGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 125,
          decoration: const BoxDecoration(
            color: Black.secondary,
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppSize.w6,
              ),
            ),
          ),
        ),
        const Gap(),
        Text(
          "Air Zoom SuperRep",
          style: AppTextStyle.medium.copyWith(
            fontSize: AppSize.w16,
          ),
        ),
        const Gap(height: AppSize.w4),
        Row(
          children: [
            Text(
              "Nike · ",
              style: AppTextStyle.medium.copyWith(
                color: Blue.primary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              margin: const EdgeInsets.only(
                left: AppSize.w4,
              ),
              decoration: BoxDecoration(
                color: Yellow.primary.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppSize.w6,
                  ),
                ),
              ),
              child: Text(
                "52.214 Sold",
                style: AppTextStyle.medium.copyWith(
                  fontSize: AppSize.w12,
                  color: Yellow.primary,
                ),
              ),
            ),
          ],
        ),
        const Gap(height: AppSize.w4),
        Text(
          "IDR 1.799.000",
          style: AppTextStyle.medium.copyWith(
            fontSize: AppSize.w16,
          ),
        ),
      ],
    );
  }
}
