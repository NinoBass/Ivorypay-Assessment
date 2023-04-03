import 'package:flutter/material.dart';
import 'package:ivorypay/src/presentation/resources/colors.res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class ModalUi extends StatelessWidget {
  const ModalUi({
    super.key,
    required this.child,
    this.contentPadding = 24.0,
    this.horizontalPadding = 20.0,
    this.bottomGap = 16,
  });

  final Widget child;
  final double contentPadding;
  final double horizontalPadding;
  final double bottomGap;

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(20);
    final kBottomPadding = MediaQuery.of(context).padding.bottom;
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        decoration: const BoxDecoration(
          color: primary900,
          borderRadius: BorderRadius.vertical(
            top: borderRadius,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Center(
              child: ModalDragIndicatorUi(),
            ),
            Gap(contentPadding),
            Flexible(child: child),
            Gap(bottomGap + kBottomPadding),
          ],
        ),
      ),
    );
  }
}
