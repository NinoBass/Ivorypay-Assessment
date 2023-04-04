import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/quick_actions.enum.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/controller/portfolio.controller.dart';
import 'package:ivorypay/src/presentation/global_widgets/modal.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class SeeAllQuickActionsModalUi extends GetView<PortfolioController> {
  const SeeAllQuickActionsModalUi({
    super.key,
  });

  @override
  PortfolioController get controller => Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return ModalUi(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextUi.title3(
                'Quick Actions',
                fontWeight: boldText,
              ),
              GestureDetector(
                onTap: Get.back<void>,
                child: Icon(
                  Icons.close,
                  color: grayScale50,
                  size: 24.w,
                ),
              ),
            ],
          ),
          const Gap(32),
          ...groupBy(
            QuickActionsEnum.values,
            (action) => action.category,
          ).entries.map<Widget>((entry) {
            final category = entry.key;
            final actions = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextUi.body2(
                    category,
                  ),
                  const Gap(8),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 16.w,
                    children: actions.map((action) {
                      return QuickActionTileUi(
                        action,
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }),
          const Gap(24),
        ],
      ),
    );
  }
}
