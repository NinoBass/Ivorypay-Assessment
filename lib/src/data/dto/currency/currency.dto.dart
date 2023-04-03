import 'package:ivorypay/src/presentation/resources/res.dart';

class CurrencyDto {
  const CurrencyDto({
    required this.currency,
    required this.flag,
    required this.abbr,
  });

  final String currency;
  final String flag;
  final String abbr;
}

const supportedCurrencies = <CurrencyDto>[
  CurrencyDto(
    abbr: 'NGN',
    currency: 'N',
    flag: nigerianFlagIcon,
  ),
  CurrencyDto(
    abbr: 'KES',
    currency: 'KES',
    flag: kenyaFlagIcon,
  ),
  CurrencyDto(
    abbr: 'GHC',
    currency: 'GHC',
    flag: ghanaFlagIcon,
  ),
  CurrencyDto(
    abbr: 'ZAR',
    currency: 'ZAR',
    flag: southAfricaFlagIcon,
  ),
];
