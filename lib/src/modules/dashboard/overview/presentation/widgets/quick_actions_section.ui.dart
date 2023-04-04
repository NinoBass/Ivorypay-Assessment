import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/quick_actions.enum.dart';
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
              onTap: controller.openSeeMoreActionsModal,
              child: const TextUi.body2(
                'See more',
                color: secondary600,
                fontWeight: mediumText,
              ),
            ),
          ],
        ),
        const Gap(12),
        Wrap(
          spacing: 8.w,
          runSpacing: 16.w,
          children: QuickActionsEnum.values.take(8).map((action) {
            return QuickActionTileUi(action);
          }).toList(),
        ),
      ],
    );
  }
}
