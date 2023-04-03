// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class ButtonUi extends TextButton {
  const ButtonUi({
    super.key,
    required this.style,
    required this.child,
    this.onPressed,
  }) : super(
          style: style,
          onPressed: onPressed,
          child: child,
        );

  final ButtonStyle style;
  final Widget child;
  final VoidCallback? onPressed;
}

class PrimaryButtonUi extends ButtonUi {
  PrimaryButtonUi({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.icon,
    this.disabledColor,
    this.loading = false,
  }) : super(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
              padding ?? const EdgeInsets.symmetric(horizontal: 16).r,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            maximumSize: MaterialStateProperty.all(
              Size.fromHeight(48.w),
            ),
            fixedSize: MaterialStateProperty.all(
              Size.fromHeight(48.w),
            ),
            minimumSize: MaterialStateProperty.all(
              Size.fromHeight(48.w),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  xsmallRadius,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return backgroundColor ?? primary600;
                } else if (states.contains(MaterialState.disabled)) {
                  return disabledColor ??
                      backgroundColor?.withOpacity(.8) ??
                      primary600.withOpacity(.2);
                }
                return backgroundColor ??
                    primary600; // Use the component's default.
              },
            ),
          ),
          onPressed: onPressed,
          child: loading
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      icon,
                      const Gap(8),
                    ],
                    TextUi(
                      text,
                      color: textColor,
                      style: buttonTypography.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
        );

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final bool loading;
  final Widget? icon;
  final Color? disabledColor;
}
