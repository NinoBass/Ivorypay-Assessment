import 'package:get/get.dart';
import 'package:ivorypay/src/data/data_sources/local/key_value_storage_service.dart';
import 'package:ivorypay/src/data/data_sources/remote/api_service.dart';
import 'package:ivorypay/src/data/data_sources/remote/dio_service.dart';
import 'package:ivorypay/src/domain/services/services.dart';
import 'package:ivorypay/src/domain/services/wallet.service.dart';

class ServicesInjector {
  ServicesInjector._();

  static Future<void> initializeServices() async {
    ///Init all services here
    Get
      ..lazyPut(NavigationService.new)
      ..lazyPut(() => ApiService(dioServiceProvider))
      ..lazyPut(KeyValueStorageService.new)
      ..lazyPut(WalletService.new);
  }
}
