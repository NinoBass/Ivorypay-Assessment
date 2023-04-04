import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/onboarding/controller/onboarding.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OnboardingUi extends GetView<OnboardingController> {
  const OnboardingUi({super.key});

  @override
  OnboardingController get controller => Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: baseViewPadding.w,
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeInUp(
                        delay: superFastDuration,
                        from: 75,
                        child: Image.asset(
                          nftImage,
                          width: 240.w,
                          height: 240.w,
                        ),
                      ),
                      const Gap(56),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        from: 75,
                        child: Text.rich(
                          TextSpan(
                            text: 'Crypto payments',
                            style: title2.copyWith(
                              color: secondary600,
                            ),
                            children: [
                              TextSpan(
                                text: ' for online and offline businesses in ',
                                style: title2.copyWith(
                                  color: grayScale50,
                                ),
                              ),
                              TextSpan(
                                text: 'Africa',
                                style: title2.copyWith(
                                  color: grayScale50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(8),
                      FadeInUp(
                        from: 75,
                        delay: const Duration(milliseconds: 300),
                        child: const TextUi.body1(
                          'Connect your business to a global decentralized network and start accepting payments in crypto currencies.',
                        ),
                      ),
                      const Gap(56),
                      FadeInUp(
                        from: 75,
                        delay: const Duration(milliseconds: 400),
                        child: Builder(
                          builder: (context) {
                            return SlideAction(
                              sliderRotate: false,
                              outerColor: primary600,
                              innerColor: black,
                              key: controller.slideActionButtonKey,
                              sliderButtonIcon: SvgPicture.asset(
                                arrowRightIcon,
                                color: white,
                                height: 16.w,
                                width: 16.w,
                                fit: BoxFit.scaleDown,
                              ),
                              onSubmit: controller.goToDashboard,
                              child: FadeInLeft(
                                delay: fastDuration,
                                child: const TextUi.body2(
                                  'Swipe to get started',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap(24),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
