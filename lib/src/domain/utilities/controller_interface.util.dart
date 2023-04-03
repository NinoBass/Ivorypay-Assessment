import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/view_state.enum.dart';

class BaseController extends GetxController {
  final _viewState = ViewState.idle.obs;
  ViewState get viewState => _viewState.value;
  set viewState(ViewState state) {
    _viewState.value = state;
  }
}
