import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ivorypay/bootstrapper.dart';
import 'package:ivorypay/ivorypay_app.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await AppBootstrapper.init(
    mainAppWidget: const IvorypayApp(),
    runApp: runApp,
  );
}
