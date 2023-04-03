import 'package:flutter/widgets.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

enum ErrorType {
  success(
    backgroundColor: success50,
    color: success600,
    icon: circleCheckIcon,
  ),
  failed(
    backgroundColor: error50,
    color: error600,
    icon: circleErrorIcon,
  );

  const ErrorType({
    required this.color,
    required this.backgroundColor,
    required this.icon,
  });
  final Color color;
  final Color backgroundColor;
  final String icon;
}

extension ErrorTypeX on ErrorType {
  bool get isSuccess => this == ErrorType.success;
  bool get isFailure => this == ErrorType.failed;
}
