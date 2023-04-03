import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/domain/services/navigation.services.dart';
import 'package:ivorypay/src/routing/app_pages.dart';
import 'package:slide_to_act/slide_to_act.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() {
    slideActionButtonKey = GlobalKey<SlideActionState>(
      debugLabel: 'Slide Action Button',
    );
    super.onInit();
  }

  late GlobalKey<SlideActionState> slideActionButtonKey;
  void goToDashboard() {
    navigationService.navigateTo(
      Routes.dashboard,
    );
  }
}
