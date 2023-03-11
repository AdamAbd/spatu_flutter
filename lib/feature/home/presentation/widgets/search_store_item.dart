import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class SearchStoreItem extends StatelessWidget {
  const SearchStoreItem({
    super.key,
    required SearchStoreEntity searchStoreEntity,
  }) : _searchStoreEntity = searchStoreEntity;

  final SearchStoreEntity _searchStoreEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.w24,
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: AppSize.w12,
                ),
                width: AppSize.w32,
                height: AppSize.w32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppIcon.logo),
                  ),
                ),
              ),
              Text(
                "${_searchStoreEntity.brand} Official Store",
                style: AppTextStyle.medium.copyWith(
                  fontSize: AppSize.w16,
                ),
              ),
            ],
          ),
        ),
        const Gap(height: AppSize.w16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _searchStoreEntity.item.length,
          itemBuilder: (context, index) {
            final SearchStoreItemEntity searchStoreItem =
                _searchStoreEntity.item[index];

            return Padding(
              padding: EdgeInsets.only(
                left: AppSize.w24,
                right: AppSize.w24,
                bottom: index != _searchStoreEntity.item.length - 1
                    ? AppSize.w12
                    : AppSize.w16,
              ),
              child: WishlistItem(
                label: searchStoreItem.label,
                brand: searchStoreItem.brand,
                sold: searchStoreItem.sold,
                price: searchStoreItem.price,
              ),
            );
          },
        ),
      ],
    );
  }
}
