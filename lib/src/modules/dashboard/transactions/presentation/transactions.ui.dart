import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/transactions/controller/transactions.controller.dart';
import 'package:ivorypay/src/modules/dashboard/transactions/presentation/widgets/empty_transactions_state.ui.dart';
import 'package:ivorypay/src/modules/dashboard/transactions/presentation/widgets/header.ui.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class TransactionsUi extends GetView<TransactionsController> {
  const TransactionsUi({super.key});

  @override
  TransactionsController get controller => Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TransactionsHeaderUi(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  if (controller.transactions.isEmpty)
                    SliverPadding(
                      padding: baseViewPadding.w,
                      sliver: const SliverFillRemaining(
                        hasScrollBody: false,
                        child: EmptyTransactionsStateUi(),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: baseViewPadding.w,
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: const [
                            TextUi.body1(
                              'All wallets',
                              fontWeight: mediumText,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
