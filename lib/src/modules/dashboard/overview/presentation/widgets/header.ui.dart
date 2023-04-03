import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/dashboard_manager.dart';
import 'package:ivorypay/src/modules/dashboard/overview/controller/overview.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class OverviewHeaderUi extends GetView<OverviewController> {
  const OverviewHeaderUi({
    super.key,
  });

  @override
  OverviewController get controller => Get.put(OverviewController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: Get.find<DashboardManager>().goToProfile,
            child: const UserAvatarUi(),
          ),
          const Gap(12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextUi.body1(
                  'Hello, Oluwaseun',
                  fontWeight: mediumText,
                ),
                TextUi.caption(
                  'It’s another good day to get that bag',
                  color: grayScale200,
                ),
              ],
            ),
          ),
          const Gap(24),
          SvgPicture.asset(
            activeBellIcon,
            height: 24.w,
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
