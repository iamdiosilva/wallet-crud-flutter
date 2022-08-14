class TransactionModel {
  int? id;
  final double amount;

  TransactionModel({BigInt? id, required this.amount});

  TransactionModel fromJson(Map<String, Object?> json) => TransactionModel(
        id: json['id'] as BigInt,
        amount: json['amount'] as double,
      );
}
