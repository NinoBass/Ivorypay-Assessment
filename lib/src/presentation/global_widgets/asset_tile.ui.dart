import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/domain/services/navigation.services.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class AssetsTileUi extends StatelessWidget {
  const AssetsTileUi({
    super.key,
    required this.asset,
  });

  final AssetDto asset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigationService.goBack(
          result: asset,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8).r,
        margin: const EdgeInsets.only(bottom: 24).r,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            smallRadius,
          ),
          color: grayScale50.withOpacity(.08),
        ),
        child: Row(
          children: [
            NetworkImageUi(
              imageUrl: asset.image ?? '',
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUi.body1(
                    asset.name ?? '',
                    fontWeight: mediumText,
                  ),
                  TextUi.caption(
                    asset.symbol ?? '',
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NairaIconUi(
                      size: 15,
                    ).paddingOnly(top: 2),
                    TextUi.body1(
                      asset.currentPrice?.toString() ?? '',
                      fontWeight: mediumText,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                TextUi.caption(
                  '${asset.priceChangePercentage24H?.toStringAsPrecision(3)}%',
                  fontWeight: mediumText,
                  color: asset.isPositivePriceChangepercentage
                      ? success600
                      : error600,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
