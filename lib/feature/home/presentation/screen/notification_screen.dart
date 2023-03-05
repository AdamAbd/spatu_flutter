import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextFieldEntity textField = TextFieldEntity.search;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppSize.w24,
                top: AppSize.w16,
                right: AppSize.w8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notification",
                    style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
                  ),
                  ButtonIcon(
                    onTap: () {},
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.w16,
                    ),
                    child: SvgPicture.asset(
                      AppIcon.buy,
                      width: AppSize.w24,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(height: AppSize.w12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.w24),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.w24,
                vertical: AppSize.w24,
              ),
              child: Text(
                "Today",
                style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
              ),
            ),
            Slidable(
              key: Key("today"),
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
              child: NotificationItem(
                icon: AppIcon.discount,
                title: "90% Special Discount!",
                desc: "Special promotion only new account",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.w24,
                vertical: AppSize.w24,
              ),
              child: Text(
                "Yesterday",
                style: AppTextStyle.medium.copyWith(fontSize: AppSize.w16),
              ),
            ),
            Slidable(
              key: Key("yesterday"),
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
              child: NotificationItem(
                icon: AppIcon.profileActive,
                title: "Account Setup Successful!",
                desc: "Your account has been created!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
