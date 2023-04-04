import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/wallet_details/controller/wallet_details.controller.dart';
import 'package:ivorypay/src/presentation/global_widgets/modal.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/utility/ui_helpers.utils.dart';
import 'package:ivorypay/src/presentation/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ReceiveCryptoModalUi extends GetView<WalletDetailsController> {
  const ReceiveCryptoModalUi({
    super.key,
  });

  @override
  WalletDetailsController get controller => Get.put(WalletDetailsController());

  @override
  Widget build(BuildContext context) {
    return ModalUi(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextUi.title3(
                'Deposit',
                fontWeight: boldText,
              ),
              GestureDetector(
                onTap: Get.back<void>,
                child: Icon(
                  Icons.close,
                  color: grayScale50,
                  size: 24.w,
                ),
              ),
            ],
          ),
          const Gap(32),
          AspectRatio(
            aspectRatio: 1.8,
            child: Center(
              child: QrImage(
                data: controller.wallet?.address ?? '',
                foregroundColor: white,
              ),
            ),
          ),
          const Gap(24),
          TextUi.caption(
            '${controller.wallet?.asset?.symbol} Wallet Address',
            color: grayScale200,
          ),
          const Gap(8),
          TextUi.body2(
            controller.wallet?.address ?? 'Empty',
            fontWeight: mediumText,
          ),
          const Gap(24),
          PrimaryButtonUi(
            text: 'Copy Wallet Address',
            onPressed: () {
              copyToClipboard(
                text: controller.wallet?.address ?? '',
              );
            },
          ),
          const Gap(12),
          PrimaryButtonUi(
            text: 'Share Address',
            backgroundColor: secondary600,
            onPressed: () {
              Share.share(controller.wallet?.address ?? '');
            },
          ),
        ],
      ),
    );
  }
}
