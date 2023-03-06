import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.w24,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SectionTitle(title: "Special Offers", onTap: () {}),
            Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppIllustration.banner,
                  ),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.w16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
