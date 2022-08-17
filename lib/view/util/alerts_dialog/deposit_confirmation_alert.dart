// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../database/supabase_handler.dart';
import '../../../models/transaction_model.dart';
import '../custom_snackbar.dart';
import 'confirmation_alert_dialog.dart';

depositConfirmationAlert({
  required BuildContext homeContext,
  required TransactionModel transaction,
}) {
  _addDeposit(BuildContext alertDialogContext) async {
    //Snackbar on AlertDialog layer
    showCustomSnackbar(
      scaffoldContext: alertDialogContext,
      color: AppColors.warning,
      durationMilliseconds: 1000,
      title: 'Requesting server',
      subtitle: 'Comunicating with server',
      trailingImagePath: AppIcons.warning,
    );

    SupabaseHandler supabaseHandler = SupabaseHandler();
    final response = await supabaseHandler.depositFunction(
      id: transaction.id!,
      description: transaction.description!,
      category: transaction.category,
      amount: transaction.amount,
      type: transaction.type,
      dateNow: transaction.transactionDate.toIso8601String(),
      iconPath: transaction.iconPath,
    );

    final error = response.error;
    await Future.delayed(const Duration(milliseconds: 1500));

    if (error != null) {
      showCustomSnackbar(
        scaffoldContext: homeContext,
        color: AppColors.error,
        durationMilliseconds: 3000,
        title: 'Comunication error',
        subtitle: error.toString(),
        trailingImagePath: AppIcons.wrong,
      );
    } else {
      showCustomSnackbar(
        scaffoldContext: homeContext,
        color: AppColors.success,
        durationMilliseconds: 3000,
        title: 'Transaction confirmed',
        subtitle: 'Transaction was successfully confirmed',
        trailingImagePath: AppIcons.check,
      );
    }
  }

  showDialog(
    context: homeContext,
    builder: (context) => ScaffoldMessenger(
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.transparent,
          body: ConfirmationAlertDialog(
            action: () async => await _addDeposit(context),
            amount: transaction.amount,
          ),
        ),
      ),
    ),
  );
}
