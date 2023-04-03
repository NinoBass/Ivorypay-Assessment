part of 'key_value_storage_service.dart';

abstract class KeyValueStorageBase {
  Future<void> deleteWalletData();

  List<WalletDto>? getWalletData();

  Future<void> cacheWalletData(String userData);
}
