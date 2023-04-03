import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/controller/portfolio.controller.dart';
import 'package:ivorypay/src/presentation/global_widgets/modal.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class SelectAssetModalUi extends GetView<PortfolioController> {
  const SelectAssetModalUi({
    super.key,
  });

  @override
  PortfolioController get controller => Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return ModalUi(
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextUi.title3(
                  'Select Asset',
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
            ...controller.assets.map((asset) {
              return AssetsTileUi(
                asset: asset,
              );
            }),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
