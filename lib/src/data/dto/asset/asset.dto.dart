import 'package:ivorypay/src/domain/utilities/typedefs.dart';

class AssetDto {
  AssetDto({
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.priceChangePercentage24H,
    this.sparklineIn7D,
  });
  factory AssetDto.fromJson(Map<String, dynamic> json) => AssetDto(
        symbol: (json['symbol'] as String?)?.toUpperCase(),
        name: json['name'] as String?,
        image: json['image'] as String?,
        currentPrice: json['current_price'] as double?,
        priceChangePercentage24H:
            json['price_change_percentage_24h'] as double?,
        sparklineIn7D: json['sparkline_in_7d'] == null
            ? null
            : SparklineIn7D.fromJson(json['sparkline_in_7d'] as JSON),
      );
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? priceChangePercentage24H;
  SparklineIn7D? sparklineIn7D;

  bool get isPositivePriceChangepercentage =>
      (priceChangePercentage24H ?? -1) > 0;

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'name': name,
        'image': image,
        'current_price': currentPrice,
        'price_change_percentage_24h': priceChangePercentage24H,
        'sparkline_in_7d': sparklineIn7D?.toJson(),
      };
}

class SparklineIn7D {
  SparklineIn7D({
    this.price,
  });
  factory SparklineIn7D.fromJson(Map<String, dynamic> json) => SparklineIn7D(
        price: json['price'] == null
            ? []
            : List<double>.from(
                (json['price'] as List<dynamic>).map(
                  (x) => double.tryParse(x.toString()),
                ),
              ),
      );

  List<double>? price;

  Map<String, dynamic> toJson() => {
        'price': price == null
            ? <dynamic>[]
            : List<dynamic>.from(
                price!.map(
                  (x) => x,
                ),
              ),
      };
}
