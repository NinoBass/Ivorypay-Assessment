import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/overview/presentation/widgets/select_assets_modal.ui.dart';

class OverviewController extends GetxController {
  //open select modal
  void openSelectAssetModal() {
    Get.bottomSheet<void>(
      const SelectAssetModalUi(),
    );
  }
}
