import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class BottomNavigationEntity {
  final String label;
  final String icon;
  final String activeIcon;

  const BottomNavigationEntity({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  static const list = [
    BottomNavigationEntity(
      label: 'Home',
      icon: AppIcon.home,
      activeIcon: AppIcon.homeActive,
    ),
    BottomNavigationEntity(
      label: 'Discovery',
      icon: AppIcon.discovery,
      activeIcon: AppIcon.discoveryActive,
    ),
    BottomNavigationEntity(
      label: 'Heart',
      icon: AppIcon.heart,
      activeIcon: AppIcon.heartActive,
    ),
    BottomNavigationEntity(
      label: 'Notification',
      icon: AppIcon.notification,
      activeIcon: AppIcon.notificationActive,
    ),
    BottomNavigationEntity(
      label: 'Profile',
      icon: AppIcon.profiles,
      activeIcon: AppIcon.profileActive,
    ),
  ];
}
