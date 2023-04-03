import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/wallet_details/controller/wallet_details.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class WalletDetailsUi extends GetView<WalletDetailsController> {
  const WalletDetailsUi({super.key});

  @override
  WalletDetailsController get controller => Get.put(WalletDetailsController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBarWithBackwardsCompatibility(
          title: '${controller.wallet?.asset?.symbol} Wallet',
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: controller.fetchAssetsDetails,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverPadding(
                  padding: baseViewPadding.w,
                  sliver: SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Gap(32),
                        Gap(16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
