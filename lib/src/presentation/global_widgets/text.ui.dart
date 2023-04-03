import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

class TextUi extends StatelessWidget {
  const TextUi(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = body2,
  });

  const TextUi.largeTitle(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.style = largeTitle,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
  });

  const TextUi.title1(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = title1,
  });

  const TextUi.title2(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = title2,
  });

  const TextUi.title3(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = title3,
  });

  const TextUi.body1(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = body1,
  });

  const TextUi.body2(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = body2,
  });

  const TextUi.caption(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = caption,
  });

  const TextUi.tiny(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.letterSpacing,
    this.overflow,
    this.style = tiny,
  });
  final String data;
  final TextStyle style;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool isSelectable;
  final double? height;
  final double? letterSpacing;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    if (isSelectable) {
      return SelectableText(
        data,
        textAlign: textAlign,
        style: style.copyWith(
          color: color,
          fontSize: style.fontSize,
          fontWeight: fontWeight,
          height: height,
        ),
        maxLines: maxLines,
      );
    }

    return Text(
      data,
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.parent,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
      softWrap: true,
      style: style.copyWith(
        color: color,
        letterSpacing: letterSpacing ?? style.letterSpacing,
        fontSize: style.fontSize?.spMin,
        height: height ?? style.height ?? 1.5,
        fontWeight: fontWeight ?? style.fontWeight,
      ),
    );
  }
}
