import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../list_tile_transaction_model.dart';
import 'modal_transaction_sheet_view.dart';

modalBottomSheetView(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: AppColors.baseColor,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.2,
      initialChildSize: 0.3,
      maxChildSize: 0.5,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const SizedBox(height: 10),
              ListTileTransactionModel(
                imagePath: AppIcons.cashFlow,
                title: 'Do Transaction',
                subTitle: 'Add debit or credit',
                action: () => modalTransactionSheetView(context),
              ),
            ],
          ),
        );
      },
    ),
  );
}
