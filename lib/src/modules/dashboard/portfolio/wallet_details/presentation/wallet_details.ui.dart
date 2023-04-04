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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(16),
                        Container(
                          padding: const EdgeInsets.all(16).r,
                          decoration: BoxDecoration(
                            color: primary600.withOpacity(.2),
                            borderRadius: const BorderRadius.all(
                              smallRadius,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4).r,
                                    decoration: const BoxDecoration(
                                      color: grayScale50,
                                      borderRadius: BorderRadius.all(
                                        smallRadius,
                                      ),
                                    ),
                                    child: NetworkImageUi(
                                      size: 32,
                                      imageUrl:
                                          controller.wallet?.asset?.image ?? '',
                                    ),
                                  ),
                                  const Gap(12),
                                  TextUi.body1(
                                    controller.wallet?.asset?.name ?? '',
                                    fontWeight: mediumText,
                                  ),
                                  const Spacer(),
                                  TextUi.body2(
                                    '${controller.wallet?.asset?.priceChangePercentage24H?.toStringAsPrecision(3)}%',
                                    fontWeight: mediumText,
                                    color: controller.wallet?.asset
                                                ?.isPositivePriceChangepercentage ??
                                            false
                                        ? success600
                                        : error600,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              const Gap(16),
                              const TextUi.caption(
                                'Available Balance',
                                color: grayScale100,
                              ),
                              const Gap(8),
                              Row(
                                children: [
                                  TextUi.body1(
                                    "${controller.wallet?.cryptoBalance ?? '0.0'}",
                                    fontWeight: mediumText,
                                  ),
                                  const Gap(2),
                                  const TextUi.body1(
                                    'USDT',
                                    color: grayScale200,
                                  ),
                                ],
                              ),
                              const Gap(4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextUi.body1(
                                    '≈',
                                    color: secondary600,
                                  ),
                                  const Gap(4),
                                  const NairaIconUi(
                                    size: 15,
                                    color: grayScale200,
                                  ).paddingOnly(top: 2),
                                  TextUi.body1(
                                    controller.wallet?.fiatBalance.toString() ??
                                        '0.0',
                                    fontWeight: mediumText,
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(24),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButtonUi(
                                text: 'Receive',
                                backgroundColor: secondary600,
                                icon: Container(
                                  width: 24.w,
                                  height: 24.w,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white10,
                                  ),
                                  child: Icon(
                                    Icons.call_received,
                                    size: 16.w,
                                    color: grayScale50,
                                  ),
                                ),
                                onPressed: controller.openReceiveAssetModal,
                              ),
                            ),
                            const Gap(20),
                            Expanded(
                              child: PrimaryButtonUi(
                                text: 'Send',
                                icon: Container(
                                  width: 24.w,
                                  height: 24.w,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white10,
                                  ),
                                  child: Icon(
                                    Icons.call_made,
                                    size: 16.w,
                                    color: grayScale50,
                                  ),
                                ),
                                onPressed: controller.openSendAssetModal,
                              ),
                            ),
                          ],
                        ),
                        const Gap(24),
                        const TextUi.body2(
                          'Recent Transactions',
                          color: grayScale200,
                        ),
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
