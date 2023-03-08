import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/feature/home/data/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required Key customKey,
    required NotificationItemEntity itemEntity,
  })  : _customKey = customKey,
        _itemEntity = itemEntity;

  final Key _customKey;
  final NotificationItemEntity _itemEntity;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: _customKey,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        extentRatio: 1 / 7,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Red.tertiary,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        extentRatio: 1 / 7,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Red.tertiary,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSize.w24),
        child: Container(
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
                child: SvgPicture.asset(
                  _itemEntity.type == NotificationType.registered
                      ? AppIcon.profileActive
                      : AppIcon.discount,
                  width: AppSize.w28,
                ),
              ),
              const Gap(width: AppSize.w12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _itemEntity.label,
                      style: AppTextStyle.medium.copyWith(
                        fontSize: AppSize.w16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(height: AppSize.w6),
                    Text(
                      _itemEntity.desc,
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
        ),
      ),
    );
  }
}
