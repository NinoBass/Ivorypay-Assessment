import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

class DashboardTab {
  const DashboardTab({
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;
}

final dashboardTabs = <DashboardTab>[
  DashboardTab(
    label: 'Overview',
    icon: TernavIcons.bold.home_2,
  ),
  DashboardTab(
    label: 'Portfolio',
    icon: TernavIcons.bold.graph,
  ),
  DashboardTab(
    label: 'Transactions',
    icon: TernavIcons.bold.note,
  ),
  DashboardTab(
    label: 'Settings',
    icon: TernavIcons.bold.settings,
  ),
];
