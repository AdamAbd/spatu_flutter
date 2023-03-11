import 'package:flutter/material.dart';

import 'package:spatu_flutter/feature/feature.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollViewWrapper(
        slivers: [
          const CustomSliverAppBar(
            title: "Notification",
            icon: AppIcon.setting,
            isDivideBottom: true,
          ),
          const SliverGap(height: AppSize.w24),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => NotificationDate(
                notificationEntity: NotificationEntity.list[index],
              ),
              childCount: NotificationEntity.list.length,
            ),
          ),
        ],
      ),
    );
  }
}
