import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/data_sources/local/key_value_storage_service.dart';
import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/data/enums/view_state.enum.dart';
import 'package:ivorypay/src/domain/repositories/wallet/wallet.repository.dart';
import 'package:ivorypay/src/domain/services/wallet.service.dart';
import 'package:ivorypay/src/domain/utilities/controller_interface.util.dart';
import 'package:ivorypay/src/modules/dashboard/portfolio/overview/presentation/widgets/select_assets_modal.ui.dart';

class PortfolioController extends BaseController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wallets.value = keyValueStorageService.getWalletData() ?? [];
      getAssetsData();
    });

    super.onInit();
  }

  final wallets = <WalletDto>[].obs;
  final assets = <AssetDto>[].obs;

  Future<void> createWallet() async {
    //show modal
    await Get.bottomSheet<dynamic>(
      const SelectAssetModalUi(),
      isScrollControlled: true,
    ).then((asset) async {
      if (asset is AssetDto) {
        final mnemonic = walletServiceProvider.generateMnemonic();
        final privateKey = await walletServiceProvider.getPrivateKey(mnemonic);
        final publicKey = await walletServiceProvider.getPublicKey(privateKey);
        log(privateKey);
        log(publicKey.toString());

        //create wallet instance
        final wallet = WalletDto(
          privateKey: privateKey,
          publicKey: publicKey.toString(),
          asset: asset,
        );

        //update ui
        wallets
          ..add(wallet)
          ..refresh();

        //persist wallet data
        await keyValueStorageService.cacheWalletData(
          jsonEncode(wallets),
        );
      }
    });
  }

  Future<void> getAssetsData() async {
    try {
      viewState = ViewState.busy;
      final assets = await walletRepositoryProvider.fetchCoinData();

      for (final wallet in wallets) {
        assets.removeWhere((asset) => wallet.asset?.name == asset.name);
      }

      this.assets.value = assets;
      viewState = ViewState.idle;
    } catch (e, s) {
      viewState = ViewState.idle;
      log(
        e.toString(),
        stackTrace: s,
      );
    }
  }
}
