class TransactionDto {
  TransactionDto({
    this.transactionCategory,
    this.transactionName,
    this.transactionDescription,
    this.transactionAmount,
    this.transactionTime,
    this.transactionStatus,
    this.transactionDate,
    this.transactionType,
    this.block,
    this.transactionRef,
  });

  factory TransactionDto.fromJson(Map<String, dynamic> json) => TransactionDto(
        transactionCategory: json['transactionCategory'] as String?,
        transactionName: json['transactionName'] as String?,
        transactionDescription: json['transactionDescription'] as String?,
        transactionAmount: json['transactionAmount'] as num?,
        transactionTime: json['transactionTime'] as String?,
        transactionRef: json['transactionRef'] as String?,
        transactionStatus: json['transactionStatus'] as String?,
        transactionDate: json['transactionDate'] == null
            ? null
            : DateTime.tryParse(json['transactionDate'] as String),
        transactionType: json['transactionType'] as String?,
        block: json['block'] as String?,
      );

  final String? transactionCategory;
  final String? transactionName;
  final String? transactionDescription;
  final num? transactionAmount;
  final String? transactionTime;
  final String? transactionStatus;
  final String? transactionRef;
  final DateTime? transactionDate;
  final String? transactionType;
  final String? block;

  bool get isBillsPayment => transactionCategory == 'Bills';
  bool get isIncoming => transactionType == 'Credit';
  bool get isSuccessful => transactionStatus == 'Successful';
}
