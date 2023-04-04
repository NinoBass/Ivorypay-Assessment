import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/data/enums/wallet_action.enum.dart';
import 'package:ivorypay/src/domain/services/navigation.services.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/wallet_details/presentation/widgets/receive_crypto_modal.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';
import 'package:ivorypay/src/routing/app_pages.dart';

class WalletTileUi extends StatelessWidget {
  const WalletTileUi({
    super.key,
    required this.wallet,
    required this.action,
  });

  final WalletAction action;
  final WalletDto wallet;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (action.isViewDetails) {
          //open detail page
          navigationService.navigateTo(
            Routes.walletDetails,
            arguments: wallet,
          );
        } else if (action.isReceiveCrypto) {
          if (Get.isOverlaysOpen) {
            Get.back<void>();
          }
          Get.bottomSheet<void>(
            ReceiveCryptoModalUi(
              wallet: wallet,
            ),
            isScrollControlled: true,
          );
        } else if (action.isSendCrypto) {
          //open send page
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8).r,
        margin: const EdgeInsets.only(bottom: 24).r,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            smallRadius,
          ),
          color: primary600.withOpacity(.1),
        ),
        child: Row(
          children: [
            NetworkImageUi(
              imageUrl: wallet.asset?.image ?? '',
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUi.body1(
                    wallet.asset?.name ?? '',
                    fontWeight: mediumText,
                  ),
                  TextUi.caption(
                    wallet.asset?.symbol ?? '',
                  ),
                ],
              ),
            ),
            const Gap(12),
            Expanded(
              child: SizedBox(
                height: 56.w,
                child: Sparkline(
                  data: wallet.asset?.sparklineIn7D?.price ?? [],
                  lineColor:
                      wallet.asset?.isPositivePriceChangepercentage ?? false
                          ? success600
                          : error600,
                ),
              ),
            ),
            const Gap(24),
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
                      wallet.fiatBalance.toString(),
                      fontWeight: mediumText,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                TextUi.caption(
                  '${wallet.asset?.priceChangePercentage24H?.toStringAsPrecision(3)}%',
                  fontWeight: mediumText,
                  color: wallet.asset?.isPositivePriceChangepercentage ?? false
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
