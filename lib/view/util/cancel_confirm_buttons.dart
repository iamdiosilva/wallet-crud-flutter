import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CancelConfirmButtons extends StatelessWidget {
  final Function() action;
  const CancelConfirmButtons({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Cancel button
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

        //Confirm Button
        Expanded(
          child: ElevatedButton(
            onPressed: action,
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
    );
  }
}
