import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/domain/services/services.dart';
import 'package:ivorypay/src/domain/utilities/database_config.util.dart';
import 'package:ivorypay/src/domain/utilities/services_injector.util.dart';

/// A wrapper class that contains methods to bootstrap the app launch.
///
/// It initializes the important services at app startup to allow
/// syncronous access to them later on.
class AppBootstrapper {
  const AppBootstrapper._();

  /// Initializer for important and asyncronous app services
  /// Should be called in main after `WidgetsBinding.FlutterInitialized()`.
  ///
  /// [mainAppWidget] is the first widget that loads on app startup.
  /// [runApp] is the main app binding method that launches our [mainAppWidget].
  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [
        SystemUiOverlay.bottom,
        SystemUiOverlay.top,
      ],
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    //Let's encrpyt certificate for trusting http & https api calls
    final data = await PlatformAssetBundle()
        .load('assets/certificates/lets-encrypt-r3.pem');
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asUint8List());

    // For restricting the app to portrait mode only
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //initialize screen util and ensure sizing
    await ScreenUtil.ensureScreenSize();

    // For preparing to read application directory paths
    await PathProviderService.init();

    // For preparing to services to be used in app
    await ServicesInjector.initializeServices();

    // For preparing to hive database i.e open boxes, e.t.c
    await DatabaseConfig.initializeHive();

    // For prettyifying console debug messages
    debugPrint = _prettifyDebugPrint;

    // For preparing the error monitoring SDK and loading
    // up the `runApp` method in a guarded zone
    runApp(mainAppWidget);
  }

  static void _prettifyDebugPrint(String? message, {int? wrapWidth}) {
    final date = clock.now();
    var msg = '${date.year}/${date.month}/${date.day}';
    msg += ' ${date.hour}:${date.minute}:${date.second}';
    msg += ' $message';
    debugPrintSynchronously(msg, wrapWidth: wrapWidth);
  }
}
