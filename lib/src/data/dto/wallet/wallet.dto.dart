import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/domain/utilities/typedefs.dart';

class WalletDto {
  WalletDto({
    required this.privateKey,
    required this.address,
    required this.asset,
    this.cryptoBalance = 0,
    this.fiatBalance = 0,
  });

  factory WalletDto.fromJson(Map<String, dynamic> json) => WalletDto(
        asset: json['asset'] == null
            ? null
            : AssetDto.fromJson(json['asset'] as JSON),
        address: json['address'] as String? ?? '',
        privateKey: json['privateKey'] as String? ?? '',
        cryptoBalance: json['cryptoBalance'] as double? ?? 0,
        fiatBalance: json['fiatBalance'] as double? ?? 0,
      );
  String privateKey;
  String address;
  AssetDto? asset;
  double cryptoBalance;
  double fiatBalance;

  Map<String, dynamic> toJson() => {
        'asset': asset?.toJson(),
        'privateKey': privateKey,
        'address': address,
        'cryptoBalance': cryptoBalance,
        'fiatBalance': fiatBalance,
      };
}
