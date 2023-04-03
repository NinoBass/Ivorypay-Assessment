import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/controller/portfolio.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class PortfolioHeaderUi extends GetView<PortfolioController> {
  const PortfolioHeaderUi({
    super.key,
  });

  @override
  PortfolioController get controller => Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextUi.title2(
            'Portfolio',
            fontWeight: boldText,
          ),
          InkWell(
            onTap: controller.createWallet,
            highlightColor: primary600.withOpacity(.1),
            splashColor: primary600.withOpacity(.1),
            borderRadius: const BorderRadius.all(xsmallRadius),
            child: Container(
              height: 36.w,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ).r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(xsmallRadius),
                border: Border.all(
                  color: grayScale50,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    size: 20.w,
                    color: grayScale50,
                  ),
                  const Gap(8),
                  const TextUi.caption(
                    'Add wallet',
                    fontWeight: mediumText,
                    height: 1.8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
