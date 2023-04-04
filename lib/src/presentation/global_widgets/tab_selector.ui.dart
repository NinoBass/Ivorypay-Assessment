import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/global_widgets/text.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

class SelectorTabUi extends StatelessWidget {
  const SelectorTabUi({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: fastDuration,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ).r,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          xsmallRadius,
        ),
        color: isSelected ? white : const Color(0xFFF5F4F4),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                  color: primary600.withOpacity(.10),
                ),
                BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                  color: primary600.withOpacity(.10),
                ),
              ]
            : null,
      ),
      child: TextUi.caption(
        text,
        fontWeight: mediumText,
        color: primary800,
      ),
    );
  }
}
