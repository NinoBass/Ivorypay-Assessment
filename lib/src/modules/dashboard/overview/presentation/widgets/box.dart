import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class LighBox extends StatelessWidget {
  const LighBox({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.heading,
    required this.subHeading,
  });

  final String backgroundImage;
  final String image;
  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 56.h,
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        color: grayScale50.withOpacity(.1),
        borderRadius: const BorderRadius.all(
          smallRadius,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            // height: 40.w,
            child: Stack(
              alignment: Alignment.centerRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        backgroundImage,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -2,
                  right: -8,
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    image,
                    height: 40.w,
                    width: 40.w,
                  ),
                )
              ],
            ),
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUi.body1(
                heading,
                fontWeight: mediumText,
              ),
              TextUi.caption(
                subHeading,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          const Spacer(),
          Container(
            height: 32.w,
            width: 32.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: grayScale300,
              borderRadius: BorderRadius.all(
                smallRadius,
              ),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: black,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
