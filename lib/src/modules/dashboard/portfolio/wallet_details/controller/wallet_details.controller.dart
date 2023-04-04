import 'package:get/get.dart';
import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/domain/utilities/controller_interface.util.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/wallet_details/presentation/widgets/receive_crypto_modal.ui.dart';

class WalletDetailsController extends BaseController {
  @override
  void onInit() {
    wallet = Get.arguments as WalletDto?;
    super.onInit();
  }

  late WalletDto? wallet;
  final showSellTab = false.obs;
  Future<void> fetchAssetsDetails() async {}

  void openReceiveAssetModal() {
    Get.bottomSheet<void>(
      ReceiveCryptoModalUi(
        wallet: wallet!,
      ),
      isScrollControlled: true,
    );
  }

  void openSendAssetModal() {}
}
