import 'package:ivorypay/src/presentation/resources/res.dart';

enum QuickActionsEnum {
  transaction(
    icon: transactionsIcon,
    title: 'Transactions',
    arguments: '', //just a placeholder
  ),
  paymentLink(
    icon: linkIcon,
    actionRoute: '',
    title: 'Payment Links',
  ),
  scanQr(
    icon: scanQrIcon,
    title: 'QR Pay',
    actionRoute: '',
  ),
  ivoryStoreFront(
    icon: storeIcon,
    title: 'Ivory storefront',
    actionRoute: '',
  ),
  nftStorefront(
    icon: shopIcon,
    title: 'NFT storefront',
    actionRoute: '',
  ),
  swap(
    icon: swapIcon,
    title: 'Swap',
    actionRoute: '',
  ),
  defiLoan(
    icon: incomeIcon,
    title: 'Defi Loans',
    actionRoute: '',
  ),
  stake(
    icon: stakeIcon,
    title: 'Staking',
    actionRoute: '',
  ),
  taxCalculator(
    icon: incomeIcon,
    title: 'Tax calculator',
    actionRoute: '',
  );

  const QuickActionsEnum({
    required this.title,
    required this.icon,
    this.actionRoute,
    this.arguments,
  });

  final String icon;
  final String title;
  final String? actionRoute;
  final dynamic arguments;
}

extension QuickActionsEnumX on QuickActionsEnum {
  bool get isTransactions => this == QuickActionsEnum.transaction;
}
