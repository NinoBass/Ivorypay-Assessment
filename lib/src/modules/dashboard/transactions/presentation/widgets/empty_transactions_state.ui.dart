import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class EmptyTransactionsStateUi extends StatelessWidget {
  const EmptyTransactionsStateUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          emptyTransactionsImage,
          width: 200,
        ),
        const Gap(24),
        const TextUi.body1(
          'No transaction yet🥲',
          fontWeight: mediumText,
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        const TextUi.caption(
          "Once you send or receive assets, you'll see them here.",
          textAlign: TextAlign.center,
        ),
        const Gap(60),
      ],
    );
  }
}
