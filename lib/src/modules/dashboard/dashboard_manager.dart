import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/dummy/dashboard_tabs.dummy.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/views.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class DashboardUi extends GetView<DashboardManager> {
  const DashboardUi({super.key});

  @override
  DashboardManager get controller => Get.put(DashboardManager());

  @override
  Widget build(BuildContext context) {
    final kBottomPadding =
        Platform.isAndroid ? 0 : MediaQuery.of(context).padding.bottom;

    return Obx(
      () {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 64.h,
                  child: IndexedStack(
                    index: controller.currentIndex,
                    children: <Widget>[
                      const OverviewUi(),
                      const PortfolioUi(),
                      const TransactionsUi(),
                      Container(),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SafeArea(
                    bottom: Platform.isAndroid,
                    child: Container(
                      height: bottomNavBarHeight.h + kBottomPadding.h,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ).r,
                      decoration: BoxDecoration(
                        color: primary600.withOpacity(.2),
                        borderRadius: const BorderRadius.vertical(
                          top: mediumRadius,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: dashboardTabs.asMap().entries.map(
                          (entry) {
                            final index = entry.key;
                            final item = entry.value;
                            final isActive = controller.currentIndex == index;
                            return Expanded(
                              key: ValueKey(index.toString()),
                              child: NavBarItemUi(
                                tabItem: item,
                                isActive: isActive,
                                onTap: () => controller.currentIndex = index,
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DashboardManager extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int i) {
    _currentIndex.value = i;
  }

  void goToProfile() {
    currentIndex = 3;
  }
}
