class Balance {
  int walletId;
  int userId;
  double balance;

  Balance({
    required this.walletId,
    required this.userId,
    required this.balance,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      walletId: json['wallet_id'] as int,
      userId: json['user_id'] as int,
      balance: (json['amount'] as num).toDouble(),
    );
  }
}
