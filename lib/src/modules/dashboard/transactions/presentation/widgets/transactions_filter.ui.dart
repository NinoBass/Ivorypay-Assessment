import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/transactions_filter.enum.dart';
import 'package:ivorypay/src/modules/dashboard/transactions/controller/transactions.controller.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';
import 'package:ivorypay/src/presentation/widgets.dart';
import 'package:ternav_icons/ternav_icons.dart';

class TransactionsFilter extends GetView<TransactionsController> {
  const TransactionsFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.w,
      child: Obx(
        () => Row(
          children: [
            ...TransactionsFilters.values.map(
              (filter) {
                if (filter.isDate) {
                  //don't show date filter
                  return const SizedBox.shrink();
                }
                return Container(
                  margin: const EdgeInsets.only(right: 8).r,
                  height: 36.w,
                  child: ChoiceChip(
                    backgroundColor: primary600.withOpacity(.2),
                    visualDensity: VisualDensity.compact,
                    selected: controller.filter.value == filter,
                    pressElevation: 0,
                    elevation: 0,
                    selectedColor: secondary600,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        smallRadius,
                      ),
                    ),
                    labelPadding: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ).r,
                    label: TextUi.caption(
                      filter.name.capitalizeFirst ?? '',
                      fontWeight: mediumText,
                      color: controller.filter.value == filter
                          ? grayScale50
                          : grayScale400,
                    ),
                    onSelected: (bool selected) {
                      controller.sortTransactionsList(filter);
                    },
                  ),
                );
              },
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              borderRadius: const BorderRadius.all(
                smallRadius,
              ),
              child: Container(
                width: 36.w,
                height: 36.w,
                padding: const EdgeInsets.all(4).r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: controller.filter.value.isDate
                      ? secondary600
                      : primary600.withOpacity(.2),
                  borderRadius: const BorderRadius.all(
                    smallRadius,
                  ),
                ),
                child: Icon(
                  TernavIcons.lightOutline.calender_2,
                  color: controller.filter.value.isDate
                      ? grayScale50
                      : grayScale400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
