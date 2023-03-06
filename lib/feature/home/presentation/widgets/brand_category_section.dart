import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class BrandCategorySection extends StatelessWidget {
  const BrandCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.w24),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            const Gap(height: AppSize.w12),
            SectionTitle(title: "Brand Categories", onTap: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => const BrandCardItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
