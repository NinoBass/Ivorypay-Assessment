import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivorypay/src/data/enums/transactions_filter.enum.dart';

class TransactionsController extends GetxController {
  final transactions = <dynamic>[].obs;
  final filteredTransactions = <dynamic>[].obs;

  final filter = TransactionsFilters.all.obs;

  void sortTransactionsList(TransactionsFilters filter) {
    this.filter.value = filter;
    if (filter.isCredit) {
      //TODO
    }
    if (filter.isDebit) {
      //TODO
    }

    if (filter.showAll) {
      filteredTransactions.value = transactions;
    }
  }

  void filterByDateRange(DateTimeRange? range) {
    if (range != null) {
      //TODO
    } else {
      filter.value = TransactionsFilters.all;
      filteredTransactions.value = transactions;
    }
  }
}
