import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/controller/portfolio.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class EmptyPortfolioStateUi extends GetView<PortfolioController> {
  const EmptyPortfolioStateUi({
    super.key,
  });

  @override
  PortfolioController get controller => Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          emptyWalletsImage,
        ),
        const TextUi.body1(
          'Uh-oh, It seems like your portfolio is empty🥲',
          fontWeight: mediumText,
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        const TextUi.caption(
          'Click on the button below to add an asset to your portfolio',
          textAlign: TextAlign.center,
        ),
        const Gap(36),
        PrimaryButtonUi(
          text: 'Create Wallet',
          onPressed: controller.createWallet,
        ),
      ],
    );
  }
}
