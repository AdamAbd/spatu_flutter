import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({
    super.key,
    required String label,
    required String brand,
    required int sold,
    required int price,
  })  : _label = label,
        _brand = brand,
        _sold = sold,
        _price = price;

  final String _label;
  final String _brand;
  final int _sold;
  final int _price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.w16),
      margin: const EdgeInsets.only(
        left: AppSize.w24,
        right: AppSize.w24,
        bottom: AppSize.w12,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Black.quaternary),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.w6),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: AppSize.w80,
                height: AppSize.w80,
                decoration: const BoxDecoration(
                  color: Black.secondary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSize.w6),
                  ),
                  image: DecorationImage(
                    image: AssetImage(AppIcon.logo),
                  ),
                ),
              ),
              const Gap(width: AppSize.w12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _label,
                      style: AppTextStyle.medium.copyWith(
                        fontSize: AppSize.w16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(height: AppSize.w4),
                    Row(
                      children: [
                        Text(
                          "$_brand · ",
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
                            "${NumberHelper().convertToDecimal(number: _sold)} Sold",
                            style: AppTextStyle.medium.copyWith(
                              fontSize: AppSize.w12,
                              color: Yellow.primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(height: AppSize.w4),
                    Text(
                      NumberHelper().convertToIDR(price: _price),
                      style: AppTextStyle.medium.copyWith(
                        fontSize: AppSize.w16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Gap(height: AppSize.w16),
          Row(
            children: [
              ButtonIcon(
                onTap: () {},
                backgroundColor: Black.secondary,
                buttonSize: AppSize.w40,
                child: const Icon(Icons.more_horiz),
              ),
              const Gap(width: AppSize.w16),
              Expanded(
                child: ButtonPrimary(
                  "Add to Cart",
                  height: AppSize.w40,
                  fontWeight: AppFontWeight.bold,
                  onPressed: () {},
                  trailing: SvgPicture.asset(
                    AppIcon.buy,
                    width: AppSize.w24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
