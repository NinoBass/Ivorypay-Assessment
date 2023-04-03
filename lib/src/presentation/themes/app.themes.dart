import 'package:get/get.dart';
import 'package:ivorypay/src/presentation/themes/dark.theme.dart';
import 'package:ivorypay/src/presentation/themes/light.theme.dart';

class AppThemes extends GetxService {
  AppThemes._();

  static final light = lightTheme;
  static final dark = darkTheme;
}
