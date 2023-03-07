import 'package:spatu_flutter/feature/feature.dart';

class ProfileEntity {
  final String label;
  final String icon;
  final Function() onTap;

  const ProfileEntity({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  static final list = [
    ProfileEntity(
      label: 'Edit Profile',
      icon: AppIcon.profiles,
      onTap: () {},
    ),
    ProfileEntity(
      label: 'My Address',
      icon: AppIcon.location,
      onTap: () {},
    ),
    ProfileEntity(
      label: 'Payment Method',
      icon: AppIcon.wallet,
      onTap: () {},
    ),
    ProfileEntity(
      label: 'Notification Settings',
      icon: AppIcon.notification,
      onTap: () {},
    ),
    ProfileEntity(
      label: 'Security & Privacy',
      icon: AppIcon.shield,
      onTap: () {},
    ),
    ProfileEntity(
      label: 'Help Center',
      icon: AppIcon.shield,
      onTap: () {},
    ),
    ProfileEntity(
      label: 'Log Out',
      icon: AppIcon.logout,
      onTap: () {},
    ),
  ];
}
