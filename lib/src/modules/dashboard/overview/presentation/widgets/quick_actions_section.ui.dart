import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/overview/controller/overview.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class QuickActionsSectionUi extends GetView<OverviewController> {
  const QuickActionsSectionUi({
    super.key,
  });

  @override
  OverviewController get controller => Get.put(OverviewController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextUi.body2(
              'Quick Actions',
              color: grayScale200,
            ),
            GestureDetector(
              onTap: () {},
              child: const TextUi.body2(
                'See more',
                color: secondary600,
                fontWeight: mediumText,
              ),
            ),
          ],
        ),
        const Gap(8),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.w,
          children: List.generate(8, (index) {
            return Container(
              height: 56.h,
              width: (context.width - 64.w) / 4,
              padding: EdgeInsets.fromLTRB(
                8.w,
                0,
                8.w,
                0,
              ),
              decoration: BoxDecoration(
                color: primary600.withOpacity(.1),
                borderRadius: const BorderRadius.all(
                  smallRadius,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: black.withOpacity(.08),
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
