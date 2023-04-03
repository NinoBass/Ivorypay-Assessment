import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart' show Hive;
import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/domain/utilities/typedefs.dart';
import 'package:ivorypay/src/presentation/resources/strings.res.dart';

part 'key_value_storage_base.dart';

final keyValueStorageService = Get.find<KeyValueStorageService>();

/// A service class for providing methods to store and retrieve key-value data
/// from common or secure storage.
class KeyValueStorageService extends GetxService
    implements KeyValueStorageBase {
  @override
  void onInit() {
    init();
    super.onInit();
  }

  /// Instance of flutter secure storage
  static FlutterSecureStorage? _secureStorage;

  static Future<void> init() async {
    _secureStorage ??= const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  @override
  Future<void> cacheWalletData(String userData) async {
    log('cached wallet data');
    await Hive.box<String?>(walletKey).put(walletKey, userData);
  }

  @override
  List<WalletDto>? getWalletData() {
    try {
      final walletsString = Hive.box<String?>(walletKey).get(
        walletKey,
      );

      if (walletsString != null) {
        final wallets = List<WalletDto>.from(
          (jsonDecode(walletsString) as List<dynamic>).map(
            (x) => WalletDto.fromJson(
              x as JSON,
            ),
          ),
        );

        log('wallet data fetched successfully');
        return wallets;
      }
      return null;
    } catch (e, s) {
      log(
        e.toString(),
        stackTrace: s,
      );
    }
    return null;
  }

  @override
  Future<void> deleteWalletData() async {
    log('deleted wallet data');
    await Hive.box<String?>(walletKey).delete(walletKey);
  }
}
