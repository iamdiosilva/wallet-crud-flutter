import 'package:flutter/material.dart';

import '../../controller/universal_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/transaction.dart';

class ListTileTransaction extends StatelessWidget {
  final Transaction transaction;

  ListTileTransaction({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final universalController = UniversalController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.baseColor300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Image.network(transaction.iconPath),
        ),
      ),
      title: Row(
        children: [
          //Text('(debit) ', style: AppTextStyles.listTileTitle.copyWith(color: Colors.red)),
          Text(transaction.category, style: AppTextStyles.listTileTransactions),
        ],
      ),
      subtitle: Text(
        transaction.description!,
        style: AppTextStyles.listTileSubtitle,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(universalController.dateFormat.format(transaction.transactionDate!), style: AppTextStyles.listTileTransactionsData),
          Text(universalController.hourFormat.format(transaction.transactionDate!), style: AppTextStyles.listTileTransactionsData),
          Text(
            (transaction.type == 'Debit')
                ? universalController.numberFormatPTBR.format(transaction.amount)
                : universalController.numberFormatPTBR.format(transaction.amount),
            style: (transaction.type == 'Debit') ? AppTextStyles.listTileTransactionsValueDebit : AppTextStyles.listTileTransactionsValueCredit,
          ),
        ],
      ),
    );
  }
}
