import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthGuard extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // if (route == Routes.onboarding) {
    //   final hasSetPin = keyValueStorageService.isAppPINLocked();

    //   if (hasSetPin) {
    //     return const RouteSettings(
    //       name: Routes.signInViaPin,
    //     );
    //   }
    // }
    return null;
  }
}
