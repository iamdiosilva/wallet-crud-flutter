import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ListTileTransaction extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final String data;
  final double amount;
  final bool isDebit;

  const ListTileTransaction({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.data,
    required this.amount,
    required this.isDebit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.baseColor200,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Image.asset(iconPath),
        ),
      ),
      title: Row(
        children: [
          //Text('(debit) ', style: AppTextStyles.listTileTitle.copyWith(color: Colors.red)),
          Text(title, style: AppTextStyles.listTileTransactions),
        ],
      ),
      subtitle: Text(description, style: AppTextStyles.listTileTransactions),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data, style: AppTextStyles.listTileTransactionsData),
          Text(
            (isDebit) ? (amount * -1).toString() : amount.toString(),
            style: (isDebit) ? AppTextStyles.listTileTransactionsValueDebit : AppTextStyles.listTileTransactionsValueCredit,
          ),
        ],
      ),
    );
  }
}
