import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spatu_flutter/feature/feature.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Gap(height: AppSize.w24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const NotificationDate(
                  customKey: Key("today"),
                  date: "Today",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
