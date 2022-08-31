import 'package:flutter/material.dart';

import '../../../../controller/debit_page_controller.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../util/alerts_dialog/confirmation_alert.dart';
import '../../../util/cancel_confirm_buttons.dart';
import 'components/custom_dropdown_button.dart';

class DebitPage extends StatefulWidget {
  final BuildContext homeContext;
  const DebitPage({Key? key, required this.homeContext}) : super(key: key);

  @override
  State<DebitPage> createState() => _DebitPageState();
}

class _DebitPageState extends State<DebitPage> {
  String? _selectedItem;
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final debitController = DebitPageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Debit', style: AppTextStyles.modalTransactionsTitle),
              const SizedBox(width: 10),
              Image.asset(
                AppIcons.pay,
                width: 40,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Form(
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
              ),

              //DropdownButton
              CustomDropDownButton(
                selectedItem: _selectedItem,
                items: debitController.getCategoryList(),
                onChanged: () => (String? value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 20),
          //TextFormField description
          Form(
            child: TextFormField(
              controller: _descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.description,
                  color: AppColors.white38,
                ),
                labelText: 'Description',
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

          const SizedBox(height: 20),

          //buttons
          CancelConfirmButtons(
            action: () {
              Navigator.pop(context);
              confirmationAlert(
                homeContext: widget.homeContext,
                transaction: debitController.debitTransaction(
                  amount: _amountController.text,
                  category: _selectedItem!,
                  description: _descriptionController.text,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
