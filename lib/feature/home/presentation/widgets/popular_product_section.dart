import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class PopularProductSection extends StatelessWidget {
  const PopularProductSection({
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
            SectionTitle(title: "Most Populars", onTap: () {}),
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSize.w8,
                  crossAxisSpacing: AppSize.w16,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ProductItemGrid();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
