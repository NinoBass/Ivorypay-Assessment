import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

class UserAvatarUi extends StatelessWidget {
  const UserAvatarUi({
    super.key,
    this.size = 36,
    this.style = body2,
  });

  const UserAvatarUi.big({Key? key})
      : this(
          key: key,
          size: 64,
          style: title3,
        );

  final double size;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: primary600,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            userAvatarImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
