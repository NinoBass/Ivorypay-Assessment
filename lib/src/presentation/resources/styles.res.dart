import 'package:flutter/material.dart';
import 'package:ivorypay/src/presentation/resources/radius.res.dart';

///This file contains other stylings used in the app
///Asides from font and textStyles

OutlineInputBorder inputBorder(
  Color color, {
  double width = 1,
  Radius radius = xsmallRadius,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      radius,
    ),
    borderSide: BorderSide(
      color: color,
      width: width,
    ),
  );
}

const baseViewPadding = EdgeInsets.symmetric(
  horizontal: 20,
);
