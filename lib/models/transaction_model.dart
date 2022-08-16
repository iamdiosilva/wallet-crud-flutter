class TransactionModel {
  final int? id;
  final String category;
  final String? description;
  final double amount;
  final String type;
  final DateTime transactionDate;
  final String iconPath;

  TransactionModel({
    this.id,
    required this.category,
    this.description,
    required this.amount,
    required this.type,
    required this.transactionDate,
    required this.iconPath,
  });

  TransactionModel fromJson(Map<String, Object?> json) => TransactionModel(
        id: json['id'] as int,
        category: json['category'] as String,
        description: json['description'] as String?,
        amount: json['amount'] as double,
        type: json['type'] as String,
        transactionDate: DateTime.parse(json['transaction_date'] as String),
        iconPath: json['icon_path'] as String,
      );
}
