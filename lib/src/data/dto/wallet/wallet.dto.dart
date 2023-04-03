import 'package:ivorypay/src/data/dto/dto.dart';
import 'package:ivorypay/src/domain/utilities/typedefs.dart';

class WalletDto {
  WalletDto({
    required this.privateKey,
    required this.publicKey,
    required this.asset,
    this.balance = 0,
  });

  factory WalletDto.fromJson(Map<String, dynamic> json) => WalletDto(
        asset: json['asset'] == null
            ? null
            : AssetDto.fromJson(json['asset'] as JSON),
        publicKey: json['publicKey'] as String? ?? '',
        privateKey: json['privateKey'] as String? ?? '',
        balance: json['balance'] as double? ?? 0,
      );
  String privateKey;
  String publicKey;
  AssetDto? asset;
  double balance;

  Map<String, dynamic> toJson() => {
        'asset': asset?.toJson(),
        'privateKey': privateKey,
        'publicKey': publicKey,
        'balance': balance,
      };
}
