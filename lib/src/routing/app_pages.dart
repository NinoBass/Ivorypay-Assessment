import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onboarding;

  static final pages = <GetPage<dynamic>>[
    ivorypayMainPage(
      name: Routes.dashboard,
      transition: Transition.downToUp,
      page: () => const DashboardUi(),
    ),
    ivorypayMainPage(
      name: Routes.onboarding,
      page: () => const OnboardingUi(),
    ),
    ivorypayMainPage(
      name: Routes.walletDetails,
      page: () => const WalletDetailsUi(),
    ),
  ];
}

GetPage<T> ivorypayMainPage<T>({
  required String name,
  required Widget Function() page,
  Curve curve = Curves.easeOut,
  Duration transitionDuration = regularDuration,
  Transition transition = Transition.fadeIn,
  List<GetMiddleware>? middlewares,
}) {
  return GetPage<T>(
    name: name,
    curve: curve,
    transitionDuration: transitionDuration,
    transition: transition,
    page: page,
    middlewares: middlewares,
  );
}
