import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

class ModalDragIndicatorUi extends StatelessWidget {
  const ModalDragIndicatorUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 5.h,
      margin: const EdgeInsets.only(
        top: 8,
      ),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: grayScale100,
      ),
    );
  }
}
