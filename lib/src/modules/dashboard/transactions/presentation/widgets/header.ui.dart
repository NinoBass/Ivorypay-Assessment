import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/modules/dashboard/transactions/controller/transactions.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';

class TransactionsHeaderUi extends GetView<TransactionsController> {
  const TransactionsHeaderUi({
    super.key,
  });

  @override
  TransactionsController get controller => Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TextUi.title2(
            'Transactions',
            fontWeight: boldText,
          ),
          TextUi.caption(
            'Keep track of your payments',
            color: grayScale200,
          ),
        ],
      ),
    );
  }
}
