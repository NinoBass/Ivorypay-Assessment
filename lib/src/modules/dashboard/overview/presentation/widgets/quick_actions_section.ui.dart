import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/quick_actions.enum.dart';
import 'package:ivorypay/src/modules/dashboard/overview/controller/overview.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/views.dart';
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
          children: QuickActionsEnum.values.take(8).map((action) {
            final isComingSoon = action.arguments == null;
            return GestureDetector(
              onTap: () {
                if (action.isTransactions) {
                  Get.find<DashboardManager>().currentIndex = 2;
                }
              },
              child: SizedBox(
                height: 64.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 64.h,
                      width: (context.width - 64.w) / 4,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ).w,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Gap(4),
                          SvgPicture.asset(
                            action.icon,
                            color: secondary600,
                            width: 24.w,
                            height: 24.w,
                          ),
                          const Gap(4),
                          TextUi.tiny(
                            action.title,
                            fontWeight: mediumText,
                            textAlign: TextAlign.center,
                            height: 14 / 12,
                          ),
                        ],
                      ),
                    ),
                    if (isComingSoon)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ).r,
                          decoration: BoxDecoration(
                            color: grayScale600.withOpacity(.5),
                            borderRadius: const BorderRadius.all(
                              xsmallRadius,
                            ),
                          ),
                          child: const TextUi.tiny(
                            'Coming Soon',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
