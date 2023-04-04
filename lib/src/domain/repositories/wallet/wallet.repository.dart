import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:ivorypay/src/data/data_sources/remote/api_service.dart';
import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/domain/utilities/typedefs.dart';

final walletRepositoryProvider = WalletRepository(
  apiService: Get.find<ApiService>(),
);

class WalletRepository {
  WalletRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  Future<DatalessDto> createWallet() async {
    return _apiService.getDocumentData<DatalessDto>(
      endpoint: '/info/tips',
      converter: (res) => DatalessDto.fromJson(res as JSON),
    );
  }

  Future<List<AssetDto>> fetchCoinData() async {
    return _apiService.getDocumentData<List<AssetDto>>(
      endpoint: 'https://api.coingecko.com/api/v3/coins/markets',
      headers: {
        'user-agent': Platform.operatingSystem,
      },
      queryParams: {
        'vs_currency': 'ngn',
        'ids': 'usd-coin,tether',
        'sparkline': true,
        'locale': 'en',
      },
      converter: (res) {
        final assetsData = jsonDecode(res.toString()) as List<dynamic>;
        return List<AssetDto>.from(
          assetsData.map(
            (x) => AssetDto.fromJson(x as JSON),
          ),
        );
      },
    );
  }

  Future<List<AssetDto>> fetchWalletBalance({
    required String walletAddress,
  }) async {
    return _apiService.sendData<List<AssetDto>>(
      endpoint: 'https://eth.nownodes.io',
      headers: {
        'api-key': '01b1bdad-6a1e-4a2a-a378-5ceb1c5d7cba',
        'user-agent': Platform.operatingSystem,
      },
      data: {
        'jsonrpc': '2.0',
        'method': 'eth_getBalance',
        'params': [
          walletAddress,
          'latest',
        ],
        'id': 1
      },
      converter: (res) {
        final assetsData = jsonDecode(res.toString()) as List<dynamic>;
        return List<AssetDto>.from(
          assetsData.map(
            (x) => AssetDto.fromJson(x as JSON),
          ),
        );
      },
    );
  }
}
