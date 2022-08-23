// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../models/transaction.dart';
import 'confirmation_alert_dialog.dart';

confirmationAlert({required BuildContext homeContext, required Transaction transaction}) {
  showDialog(
    context: homeContext,
    builder: (context) => ScaffoldMessenger(
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.transparent,
          body: ConfirmationAlertDialog(
            homeContext: homeContext,
            transaction: transaction,
          ),
        ),
      ),
    ),
  );
}
