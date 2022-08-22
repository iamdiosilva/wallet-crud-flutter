class Transaction {
  final int? transactionId;
  final int userId;
  final String type;
  final String category;
  final double amount;
  final String? description;
  final DateTime? transactionDate;
  final String iconPath;

  Transaction({
    this.transactionId,
    required this.userId,
    required this.type,
    required this.category,
    required this.amount,
    this.description,
    this.transactionDate,
    required this.iconPath,
  });

  factory Transaction.fromJson(Map<String, Object?> json) => Transaction(
        transactionId: json['transaction_id'] as int,
        userId: json['user_id'] as int,
        type: json['type'] as String,
        category: json['category'] as String,
        description: json['description'] as String?,
        amount: (json['amount'] as num).toDouble(),
        transactionDate: DateTime.parse(json['transaction_date'] as String),
        iconPath: json['icon_path'] as String,
      );
}
