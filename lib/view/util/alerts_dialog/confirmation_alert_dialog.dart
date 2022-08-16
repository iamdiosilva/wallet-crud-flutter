import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_text_styles.dart';

class ConfirmationAlertDialog extends StatefulWidget {
  final Function action;
  final double? amount;

  const ConfirmationAlertDialog({Key? key, required this.action, this.amount}) : super(key: key);

  @override
  State<ConfirmationAlertDialog> createState() => _ConfirmationAlertDialogState();
}

class _ConfirmationAlertDialogState extends State<ConfirmationAlertDialog> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColors.baseColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Deposit Request',
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
            text: 'You have requested to deposit ',
            style: AppTextStyles.alertDialogContent,
          ),
          TextSpan(
            text: widget.amount!.toString(),
            style: AppTextStyles.listTileTransactionsValueCredit,
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
                  await widget.action();

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
