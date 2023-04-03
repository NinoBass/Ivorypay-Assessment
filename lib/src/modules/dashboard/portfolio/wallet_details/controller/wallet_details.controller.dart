import 'package:get/get.dart';
import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/domain/utilities/controller_interface.util.dart';

class WalletDetailsController extends BaseController {
  @override
  void onInit() {
    wallet = Get.arguments as WalletDto?;
    super.onInit();
  }

  late WalletDto? wallet;
  Future<void> fetchAssetsDetails() async {}
}
