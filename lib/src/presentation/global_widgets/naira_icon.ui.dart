import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

class NairaIconUi extends StatelessWidget {
  const NairaIconUi({
    super.key,
    this.size = 18,
    this.color = grayScale50,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      nairaIcon,
      color: color,
      width: size.w,
      height: size.w,
    );
  }
}
