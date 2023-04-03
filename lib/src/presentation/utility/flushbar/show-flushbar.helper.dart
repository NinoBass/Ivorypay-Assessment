import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/error_type.enum.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

void showFlushBar({
  String title = 'Info',
  String message = '',
  ErrorType errorType = ErrorType.failed,
}) {
  Get.snackbar(
    '',
    '',
    titleText: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
            left: 16,
            right: 24,
            top: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                errorType.icon,
                width: 24.w,
                height: 24.w,
                fit: BoxFit.none,
              ),
              const Gap(8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextUi.body1(
                      title.capitalizeFirst ?? '',
                      fontWeight: mediumText,
                    ),
                    const Gap(4),
                    TextUi.caption(
                      message.capitalizeFirst ?? '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        FadeInDown(
          duration: midDuration,
          child: Transform.translate(
            offset: Offset(0, 5.h),
            child: Container(
              height: 2,
              margin: const EdgeInsets.only(
                right: 8,
                left: 4,
              ).w,
              decoration: BoxDecoration(
                color: errorType.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: bigRadius.w,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    messageText: const SizedBox.shrink(),
    barBlur: 0,
    borderRadius: 8.w,
    borderWidth: 0,
    duration: const Duration(seconds: 4),
    backgroundColor: errorType.backgroundColor,
    margin: baseViewPadding.w,
    padding: EdgeInsets.zero,
  );
}
