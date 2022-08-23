import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../controller/deposit_page_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../util/alerts_dialog/confirmation_alert.dart';
import '../../util/cancel_confirm_buttons.dart';

// ignore: must_be_immutable
class DepositPage extends StatelessWidget {
  final BuildContext homeContext;
  DepositPage({Key? key, required this.homeContext}) : super(key: key);

  final depositController = DepositPageController();

  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: AppColors.white38,
                ),
                labelText: 'Amount',
                labelStyle: AppTextStyles.textFormLabel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white38,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white70,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
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
              controller: _descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: AppTextStyles.textFormLabel,
                prefixIcon: Icon(
                  Icons.description,
                  color: AppColors.white38,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white38,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white70,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              style: TextStyle(
                color: AppColors.white70,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 25),

          //deposit transaction function is called here
          CancelConfirmButtons(
            action: () {
              Navigator.pop(context);
              final transaction = depositController.depositTransaction(
                amount: _amountController.text,
                description: _descriptionController.text,
              );
              confirmationAlert(
                homeContext: homeContext,
                transaction: transaction,
              );
            },
          ),
        ],
      ),
    );
  }
}
