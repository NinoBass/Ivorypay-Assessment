import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/domain/services/services.dart';
import 'package:ivorypay/src/presentation/themes/app.themes.dart';
import 'package:ivorypay/src/routing/app_pages.dart';
import 'package:responsive_framework/responsive_framework.dart';

class IvorypayApp extends StatelessWidget {
  const IvorypayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ivorypay',
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      onGenerateInitialRoutes: (route) {
        return [
          AppPages.pages
              .singleWhere(
                (page) => page.name == route,
              )
              .createRoute(context)
        ];
      },
      navigatorKey: navigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      themeMode: ThemeMode.dark,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      builder: (context, widget) {
        ScreenUtil.init(
          context,
          designSize: const Size(375, 812),
        );
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          minWidth: 320,
          useShortestSide: true,
          breakpoints: const [
            ResponsiveBreakpoint.autoScale(
              320,
              name: 'SMALL MOBILE',
              scaleFactor: 0.75,
            ),
            ResponsiveBreakpoint.autoScale(
              350,
              name: MOBILE,
              scaleFactor: 0.90,
            ),
            ResponsiveBreakpoint.autoScale(
              400,
              name: MOBILE,
            ),
            ResponsiveBreakpoint.resize(
              600,
              name: TABLET,
              scaleFactor: 1.2,
            ),
            ResponsiveBreakpoint.resize(
              800,
              name: TABLET,
              scaleFactor: 1.2,
            ),
          ],
        );
      },
    );
  }
}
