import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
  });

  final String icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.w16),
      margin: const EdgeInsets.symmetric(horizontal: AppSize.w24),
      decoration: const BoxDecoration(
        color: Black.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.w16),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSize.w16),
            decoration: BoxDecoration(
              color: Yellow.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(icon, width: AppSize.w28),
          ),
          const Gap(width: AppSize.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.medium.copyWith(
                    fontSize: AppSize.w16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(height: AppSize.w6),
                Text(
                  desc,
                  style: AppTextStyle.regular.copyWith(
                    fontSize: AppSize.w12,
                    color: Blue.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
