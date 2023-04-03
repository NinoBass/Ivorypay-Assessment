import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/data/dummy/dashboard_tabs.dummy.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class NavBarItemUi extends StatelessWidget {
  const NavBarItemUi({
    super.key,
    required this.tabItem,
    required this.isActive,
    required this.onTap,
  });

  final DashboardTab tabItem;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomNavBarHeight.h,
      child: Material(
        color: Colors.transparent,
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: Column(
            children: [
              NavBarIndicatorUi(isActive: isActive),
              const Gap(8),
              Icon(
                tabItem.icon,
                color: isActive ? primary600 : grayScale500,
                size: 24.w,
              ),
              const Gap(4),
              TextUi.caption(
                tabItem.label,
                fontWeight: mediumText,
                color: isActive ? primary600 : grayScale500,
              ),
              const Gap(6),
            ],
          ),
        ),
      ),
    );
  }
}
