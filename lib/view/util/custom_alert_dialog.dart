import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../core/theme/app_text_styles.dart';

customAlertDialog({required BuildContext context, String? value}) {
  AlertDialog dialog = AlertDialog(
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
          text: '$value',
          style: AppTextStyles.alertDialogContent.copyWith(color: Colors.green),
        ),
        TextSpan(
          text: ' to your account. Confirm?',
          style: AppTextStyles.alertDialogContent,
        ),
      ]),
    ),
    actions: [
      ElevatedButton(
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
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.confirmButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('Confirm', style: AppTextStyles.alertDialogTextButton),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );

  showDialog(context: context, builder: (context) => dialog);
}
