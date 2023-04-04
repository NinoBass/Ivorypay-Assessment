import 'package:ivorypay/src/presentation/resources/res.dart';

enum QuickActionsEnum {
  transaction(
    icon: transactionsIcon,
    title: 'Transactions',
    category: 'Payments',
    arguments: '', //just a placeholder
  ),
  paymentLink(
    icon: linkIcon,
    actionRoute: '',
    category: 'Products',
    title: 'Payment Links',
  ),
  scanQr(
    icon: scanQrIcon,
    title: 'QR Pay',
    category: 'Products',
    actionRoute: '',
  ),
  ivoryStoreFront(
    icon: storeIcon,
    category: 'Products',
    title: 'Ivory storefront',
    actionRoute: '',
  ),
  nftStorefront(
    icon: shopIcon,
    category: 'Products',
    title: 'NFT storefront',
    actionRoute: '',
  ),
  swap(
    icon: swapIcon,
    title: 'Swap',
    category: 'Defi Services',
    actionRoute: '',
  ),
  defiLoan(
    icon: incomeIcon,
    category: 'Defi Services',
    title: 'Defi Loans',
    actionRoute: '',
  ),
  stake(
    icon: stakeIcon,
    category: 'Defi Services',
    title: 'Staking',
    actionRoute: '',
  ),
  taxCalculator(
    icon: incomeIcon,
    title: 'Tax calculator',
    category: 'Defi Services',
    actionRoute: '',
  );

  const QuickActionsEnum({
    required this.title,
    required this.icon,
    required this.category,
    this.actionRoute,
    this.arguments,
  });

  final String icon;
  final String title;
  final String category;
  final String? actionRoute;
  final dynamic arguments;
}

extension QuickActionsEnumX on QuickActionsEnum {
  bool get isTransactions => this == QuickActionsEnum.transaction;
}
