
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:ivorypay/src/data/dto/transactions/transactions.dto.dart';

// class TransactionTileUi extends StatelessWidget {
//   const TransactionTileUi(
//     this.transaction, {
//     super.key,
//   });
//   final TransactionDto transaction;

//   @override
//   Widget build(BuildContext context) {
//     return   Padding(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           children: [
//             Container(
//               height: 40,
//               width: 40,
//               decoration: BoxDecoration(
//                 color: transaction.isIncoming
//                     ? greenColor.withOpacity(.08)
//                     : redColor.withOpacity(.08),
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(6),
//                 ),
//               ),
//               child: Center(
//                 child: SvgPicture.asset(
//                   transaction.isIncoming ? creditIcon : debitIcon,
//                   color: transaction.isIncoming ? greenColor : redColor,
//                   width: 20.67,
//                   height: 20.67,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 16,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     transaction.isBillsPayment
//                         ? transaction.billerDesc ?? ' '
//                         : transaction.accountName ?? ' ',
//                     style: const TextStyle(
//                       fontFamily: semiBold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     transaction.transactionDescription ?? '',
//                     style: const TextStyle(
//                       fontSize: 11,
//                       fontFamily: regular,
//                       letterSpacing: 0.22,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   '₦ ${NumberFormat().format(transaction.transactionAmount)}',
//                   style: const TextStyle(
//                     fontFamily: regular,
//                     letterSpacing: 0.28,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   transaction.transactionTime ?? '',
//                   style: const TextStyle(
//                     fontSize: 11,
//                     fontFamily: regular,
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),

//     );
//   }
// }
