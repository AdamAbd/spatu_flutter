import 'package:flutter/material.dart';

import 'package:spatu_flutter/feature/feature.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextFieldEntity textField = TextFieldEntity.search;
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: GestureDetector(
        onTap: () => FocusUtils(context).unfocus(),
        child: SafeArea(
          child: CustomScrollViewWrapper(
            slivers: [
              CustomSliverSearchBar(textField: textField),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.w16,
                  horizontal: AppSize.w24,
                ),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "Your Wishlist Product",
                    style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const WishlistItem(
                    label: "Metcon 7",
                    brand: "Nike",
                    sold: 52214,
                    price: 1799000,
                  ),
                  childCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
