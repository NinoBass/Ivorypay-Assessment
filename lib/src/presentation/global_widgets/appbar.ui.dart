import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/presentation/global_widgets/text.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

class AppBarUi extends StatelessWidget with PreferredSizeWidget {
  const AppBarUi({
    super.key,
    this.icon,
    required this.title,
    this.actions = const <Widget>[],
    this.bottom,
    this.onIconTap,
    this.backgroundColor = black,
    this.iconColor = grayScale50,
    this.textColor = grayScale50,
    this.leading,
    this.leadingWidth,
    this.systemOverlayStyle,
    this.toolbarHeight = kToolbarHeight,
  });

  final String title;
  final String? icon;
  final Widget? leading;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color iconColor;
  final Color? textColor;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onIconTap;
  final double? leadingWidth;
  final double toolbarHeight;
  final SystemUiOverlayStyle? systemOverlayStyle;

  bool get hasTitle => title.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: systemOverlayStyle,
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor,
      leadingWidth: leadingWidth,
      leading: icon != null
          ? InkWell(
              onTap: onIconTap ?? Get.back<void>,
              child: SvgPicture.asset(
                icon!,
                width: 20.w,
                height: 20.w,
                color: iconColor,
                fit: BoxFit.scaleDown,
              ),
            )
          : leading,
      actions: actions,
      bottom: bottom,
      centerTitle: true,
      title: hasTitle
          ? TextUi.body2(
              title,
              color: textColor,
              fontWeight: mediumText,
            )
          : null,
    );
  }

  //get height of bottom widget
  double get heightOfBottomWidget {
    if (bottom == null) return 0;
    return bottom!.preferredSize.height;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + heightOfBottomWidget);
}

class AppBarWithBackwardsCompatibility extends AppBarUi {
  const AppBarWithBackwardsCompatibility({
    super.key,
    required super.title,
    super.actions,
    super.onIconTap,
    super.backgroundColor,
    super.bottom,
    super.iconColor,
    super.textColor,
  }) : super(
          icon: arrowLeftIcon,
        );
}
