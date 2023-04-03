import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(8),
                      Container(
                        margin: baseViewPadding.w,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ).r,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            smallRadius,
                          ),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF5c369b),
                              Color(0xFF2c3489),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: black.withOpacity(.1),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextUi.caption(
                              'Total available balance',
                              color: grayScale200,
                              fontWeight: mediumText,
                            ),
                            const Gap(4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                NairaIconUi(
                                  size: 20,
                                ),
                                TextUi.title2(
                                  '0.00',
                                  fontWeight: mediumText,
                                ),
                              ],
                            ),
                            const Gap(8),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                //show dropdown
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ).r,
                                decoration: ShapeDecoration(
                                  color: grayScale50.withOpacity(.1),
                                  shape: const StadiumBorder(),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      nigerianFlagIcon,
                                      height: 12.w,
                                      width: 24.w,
                                    ),
                                    const Gap(4),
                                    TextUi.caption(
                                      'NGN',
                                      color: black,
                                      fontWeight: mediumText,
                                      height: (16 / 12).w,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 16.w,
                                      color: secondary600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      Padding(
                        padding: baseViewPadding.w,
                        child: Row(
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
                                onPressed: () {},
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
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
