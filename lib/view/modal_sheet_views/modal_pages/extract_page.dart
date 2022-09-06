import 'package:flutter/material.dart';

import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/transaction.dart';
import '../../util/separator_dots.dart';
import '../../util/separator_line.dart';

class ExtractPage extends StatelessWidget {
  final Transaction transaction;
  const ExtractPage({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Recibe', style: AppTextStyles.modalTransactionsTitle),
              const SizedBox(width: 12),
              Image.asset(
                AppIcons.recibe,
                width: 40,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const SeparatorLine(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
