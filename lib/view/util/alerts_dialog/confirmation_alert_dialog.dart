import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/confirmation_alert_dialog_controller.dart';
import '../../../controller/universal_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/transaction.dart';
import '../../../repositories/transactions_repository.dart';

// ignore: must_be_immutable
class ConfirmationAlertDialog extends StatefulWidget {
  final Transaction transaction;
  final BuildContext homeContext;

  const ConfirmationAlertDialog({Key? key, required this.transaction, required this.homeContext}) : super(key: key);

  @override
  State<ConfirmationAlertDialog> createState() => _ConfirmationAlertDialogState();
}

class _ConfirmationAlertDialogState extends State<ConfirmationAlertDialog> {
  late TransactionsRepository _transactionsRepository;
  final _confirmationAlertDialogController = ConfirmationAlertDialogController();
  final _universalController = UniversalController();

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    _transactionsRepository = context.watch<TransactionsRepository>();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColors.baseColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            (widget.transaction.type == 'Credit') ? 'Deposit Request' : 'Debit Request',
            style: AppTextStyles.alertDialogTitle,
          ),
          Image.asset(
            AppIcons.businessman,
            width: 50,
          ),
        ],
      ),
      content: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: (widget.transaction.type == 'Credit') ? 'You have requested to deposit ' : 'You have requested to debit ',
            style: AppTextStyles.alertDialogContent,
          ),
          TextSpan(
            text: _universalController.numberFormatPTBR.format(widget.transaction.amount),
            style: (widget.transaction.type == 'Credit') ? AppTextStyles.listTileTransactionsValueCredit : AppTextStyles.listTileTransactionsValueDebit,
          ),
          TextSpan(
            text: ' to your account. Confirm?',
            style: AppTextStyles.alertDialogContent,
          ),
        ]),
      ),
      actions: [
        (!isPressed)
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.cancelButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Cancel', style: AppTextStyles.alertDialogTextButton),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.cancelButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: null,
                child: Text('Cancel', style: AppTextStyles.alertDialogTextButton),
              ),
        (!isPressed)
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.confirmButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    isPressed = true;
                  });
                  await _confirmationAlertDialogController.requestTransaction(
                    alertDialogContext: context,
                    scaffoldContext: widget.homeContext,
                    action: () => _transactionsRepository.makeTransaction(widget.transaction),
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: Text('Confirm', style: AppTextStyles.alertDialogTextButton),
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.baseColor200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: null,
                child: Text('Confirm', style: AppTextStyles.alertDialogTextButton),
              ),
      ],
    );
  }
}
