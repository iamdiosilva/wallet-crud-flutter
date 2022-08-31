import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../util/draggable_incator_component.dart';
import '../util/list_tile_function_model.dart';
import 'modal_pages/debit_page/debit_page.dart';
import 'modal_pages/deposit_page.dart';
import 'modal_transaction_sheet_view.dart';

modalBottomSheetView(BuildContext context) {
  final BuildContext homeContext = context;

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
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SizedBox(height: 5),
                const DraggableIndicatorComponent(),
                const SizedBox(height: 10),
                ListTileFunctionModel(
                  imagePath: AppIcons.deposit,
                  title: 'Deposit',
                  subTitle: 'Add credit to your wallet',
                  action: () => modalTransactionSheetView(
                      context,
                      DepositPage(
                        homeContext: homeContext,
                      )),
                ),
                const SizedBox(height: 10),
                ListTileFunctionModel(
                  imagePath: AppIcons.pay,
                  title: 'Debit',
                  subTitle: 'Debit amount from your wallet',
                  action: () => modalTransactionSheetView(
                    context,
                    DebitPage(
                      homeContext: homeContext,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
