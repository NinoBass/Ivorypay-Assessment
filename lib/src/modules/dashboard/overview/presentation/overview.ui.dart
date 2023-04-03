import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/overview/controller/overview.controller.dart';
import 'package:ivorypay/src/modules/dashboard/overview/presentation/widgets/box.dart';
import 'package:ivorypay/src/modules/dashboard/overview/presentation/widgets/header.ui.dart';
import 'package:ivorypay/src/modules/dashboard/overview/presentation/widgets/quick_actions_section.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class OverviewUi extends GetView<OverviewController> {
  const OverviewUi({super.key});

  @override
  OverviewController get controller => Get.put(OverviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const OverviewHeaderUi(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: baseViewPadding.w,
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Gap(24),
                          Container(
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
                                    // const Gap(8),
                                    // Container(
                                    //   height: 20.w,
                                    //   width: 20.w,
                                    //   alignment: Alignment.center,
                                    //   padding: const EdgeInsets.all(2).r,
                                    //   decoration: BoxDecoration(
                                    //     shape: BoxShape.circle,
                                    //     border: Border.all(
                                    //       color: grayScale50,
                                    //     ),
                                    //   ),
                                    //   child: SvgPicture.asset(
                                    //     eyeIcon,
                                    //     color: grayScale50,
                                    //   ),
                                    // ),
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
                                  onPressed: controller.openSelectAssetModal,
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
                                  onPressed: controller.openSelectAssetModal,
                                ),
                              ),
                            ],
                          ),
                          const Gap(36),
                          const QuickActionsSectionUi(),
                          const Gap(36),
                          const LighBox(
                            backgroundImage: 'assets/png/box.png',
                            image: 'assets/png/rocket.png',
                            heading: 'P2P Trading',
                            subHeading: 'Bank Transfer, Paypal',
                          ),
                          const Gap(36),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextUi.body2(
                                'Recent Transactions',
                                color: grayScale200,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const TextUi.body2(
                                  'View All',
                                  color: secondary600,
                                  fontWeight: mediumText,
                                ),
                              ),
                            ],
                          ),
                          const Gap(8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
