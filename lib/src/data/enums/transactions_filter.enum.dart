enum TransactionsFilters { all, credit, debit, date }

extension FilterExt on TransactionsFilters {
  bool get showAll => this == TransactionsFilters.all;
  bool get isCredit => this == TransactionsFilters.credit;
  bool get isDate => this == TransactionsFilters.date;
  bool get isDebit => this == TransactionsFilters.debit;
}
