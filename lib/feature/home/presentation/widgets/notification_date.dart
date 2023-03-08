import 'package:flutter/material.dart';

import 'package:spatu_flutter/feature/feature.dart';
import 'package:spatu_flutter/feature/home/data/entities/notification_entity.dart';

class NotificationDate extends StatelessWidget {
  const NotificationDate({
    super.key,
    required NotificationEntity notificationEntity,
  }) : _notificationEntity = notificationEntity;

  final NotificationEntity _notificationEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.w24),
          child: Text(
            _notificationEntity.dateToHuman,
            style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
          ),
        ),
        const Gap(height: AppSize.w24),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _notificationEntity.item.length,
          itemBuilder: (context, index) {
            return NotificationItem(
              customKey: Key("$index ${_notificationEntity.dateToHuman}"),
              itemEntity: _notificationEntity.item[index],
            );
          },
        ),
      ],
    );
  }
}
