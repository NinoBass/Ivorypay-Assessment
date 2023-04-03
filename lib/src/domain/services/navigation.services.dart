import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/routing/app_pages.dart';

final navigationService = Get.find<NavigationService>();

class NavigationService extends GetxService {
  @override
  void onInit() {
    navigatorKey = GlobalKey<NavigatorState>();
    super.onInit();
  }

  late GlobalKey<NavigatorState> navigatorKey;
  BuildContext get navigationContext => navigatorKey.currentContext!;

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return Get.toNamed<dynamic>(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic>? navigateToReplace(String routeName, {dynamic arguments}) {
    return Get.offNamed<dynamic>(
      routeName,
      arguments: arguments,
    );
  }

  void navigateToAndRemoveUntil(
    String routeName, {
    dynamic arguments,
    String? endRoute,
  }) {
    return unawaited(
      Get.offAllNamed(
        routeName,
        predicate: (route) {
          if (endRoute != null) {
            return route.settings.name == endRoute;
          }
          return false;
        },
        arguments: arguments,
      ),
    );
  }

  void goBack({dynamic result}) {
    return Get.back(result: result);
  }

  void logout({dynamic result}) {
    navigateToAndRemoveUntil(
      Routes.onboarding,
    );
    navigateTo(
      Routes.login,
    );
  }
}
