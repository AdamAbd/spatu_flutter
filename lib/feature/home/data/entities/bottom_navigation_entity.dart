import 'package:flutter/material.dart';
import 'package:spatu_flutter/feature/feature.dart';

class BottomNavigationEntity {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const BottomNavigationEntity({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  static const list = [
    BottomNavigationEntity(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
    ),
    BottomNavigationEntity(
      label: 'Search',
      icon: Icons.search_outlined,
      activeIcon: Icons.search_rounded,
    ),
    BottomNavigationEntity(
      label: 'Love',
      icon: Icons.favorite_outline,
      activeIcon: Icons.favorite_rounded,
    ),
    BottomNavigationEntity(
      label: 'Notification',
      icon: Icons.notifications_none_rounded,
      activeIcon: Icons.notifications_rounded,
    ),
    BottomNavigationEntity(
      label: 'Profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person_rounded,
    ),
  ];
}
