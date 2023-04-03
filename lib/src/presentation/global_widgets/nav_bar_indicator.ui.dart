import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

class NavBarIndicatorUi extends StatelessWidget {
  const NavBarIndicatorUi({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: fastDuration,
      height: 2.h,
      width: 48.w,
      decoration: BoxDecoration(
        color: isActive ? secondary600 : Colors.transparent,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(2),
        ).r,
      ),
    );
  }
}
