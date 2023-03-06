import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:spatu_flutter/feature/feature.dart';

class NotificationDate extends StatelessWidget {
  const NotificationDate({
    super.key,
    required this.customKey,
    required this.date,
  });

  final Key customKey;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.w24),
          child: Text(
            date,
            style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
          ),
        ),
        const Gap(height: AppSize.w24),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Slidable(
              key: customKey,
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
                margin: EdgeInsets.only(bottom: AppSize.w24),
                child: const NotificationItem(
                  icon: AppIcon.profileActive,
                  title: "Account Setup Successful!",
                  desc: "Your account has been created!",
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
