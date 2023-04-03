import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class NetworkImageUi extends StatelessWidget {
  const NetworkImageUi({
    super.key,
    required this.imageUrl,
    this.size = 40,
    this.isCircle = false,
  });

  final String imageUrl;
  final double size;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: size.w,
      width: size.w,
      fit: BoxFit.cover,
      cacheHeight: size.toInt(),
      cacheWidth: size.toInt(),
      errorBuilder: (_, __, ___) {
        return SkeletonContainer(
          height: size.w,
          width: size.w,
          isCircle: isCircle,
        );
      },
      frameBuilder: (_, child, __, ___) {
        return ClipRRect(
          borderRadius: BorderRadius.all(
            isCircle ? const Radius.circular(500) : smallRadius,
          ),
          child: child,
        );
      },
      loadingBuilder: (_, child, progress) {
        if (progress?.cumulativeBytesLoaded == progress?.expectedTotalBytes) {
          return Center(
            child: child,
          );
        }
        return SkeletonContainer(
          height: size.w,
          width: size.w,
          isCircle: isCircle,
        );
      },
    );
  }
}
