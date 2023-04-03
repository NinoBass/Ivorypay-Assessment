import 'package:flutter/material.dart';
import 'package:ivorypay/src/presentation/resources/colors.res.dart';
import 'package:ivorypay/src/presentation/resources/radius.res.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({
    super.key,
    required this.height,
    required this.width,
    this.isCircle = false,
    this.borderRadius = smallRadius,
  });
  final double height;
  final double width;
  final bool isCircle;
  final Radius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: grayScale700,
      highlightColor: grayScale50.withOpacity(.6),
      period: const Duration(seconds: 2),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: grayScale700,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle
              ? null
              : BorderRadius.all(
                  borderRadius,
                ),
        ),
      ),
    );
  }
}
