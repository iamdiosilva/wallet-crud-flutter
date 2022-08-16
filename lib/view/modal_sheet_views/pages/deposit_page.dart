import 'package:flutter/material.dart';
import 'package:wallet_crud/models/transaction_model.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../models/enum/e_transaction_category.dart';
import '../../../models/enum/e_transaction_type.dart';
import '../../util/alerts_dialog/deposit_confirmation_alert.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({Key? key, required this.homeContext}) : super(key: key);

  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Deposit', style: AppTextStyles.modalTransactionsTitle),
              const SizedBox(width: 10),
              Image.asset(
                AppIcons.deposit,
                width: 40,
              ),
            ],
          ),
          const SizedBox(height: 10),

          //deposit amount form field
          Form(
            child: TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: AppColors.white38,
                ),
                labelText: 'Amount',
                labelStyle: AppTextStyles.textFormLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white38,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white70,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                color: AppColors.white70,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 25),

          //description form field
          Form(
            child: TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: AppTextStyles.textFormLabel,
                prefixIcon: Icon(
                  Icons.description,
                  color: AppColors.white38,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white38,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white70,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: TextStyle(
                color: AppColors.white70,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.cancelButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    child: Text('Cancel', style: AppTextStyles.textButton.copyWith(color: AppColors.white)),
                  ),
                ),
              ),
              const SizedBox(width: 20),

              //deposit transaction function is called here
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    TransactionModel deposit = TransactionModel(
                      id: 1,
                      category: ETransactionCategory.deposit.name,
                      amount: double.parse(amountController.text),
                      description: descriptionController.text,
                      type: ETransactionType.credit.name,
                      transactionDate: DateTime.now(),
                      iconPath: 'IconPath',
                    );
                    depositConfirmationAlert(
                      homeContext: homeContext,
                      transaction: deposit,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.confirmButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    child: Text('Confirm', style: AppTextStyles.textButton.copyWith(color: AppColors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
