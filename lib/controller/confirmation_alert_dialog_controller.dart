import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_icons.dart';
import 'custom_snackbar_controller.dart';

class ConfirmationAlertDialogController {
  requestTransaction({required BuildContext alertDialogContext, required BuildContext scaffoldContext, required Function() action}) async {
    CustomSnackbarController cSnackbarController = CustomSnackbarController();

    //Snackbar on AlertDialog layer
    cSnackbarController.requestServerInfo(context: alertDialogContext);

    final response = await action();
    final error = response.error;
    await Future.delayed(const Duration(milliseconds: 1500));

    //print(response.status.toString());

    if (error != null) {
      cSnackbarController.reponseServerInfo(
        context: scaffoldContext,
        title: 'Comunication error',
        subtitle: 'Please try again later',
        color: AppColors.error,
        iconPath: AppIcons.wrong,
      );

      //print(error.toString());
    } else {
      cSnackbarController.reponseServerInfo(
        context: scaffoldContext,
        title: 'Transaction confirmed',
        subtitle: 'Transaction was successfully confirmed',
        color: AppColors.success,
        iconPath: AppIcons.check,
      );
    }
  }
}
