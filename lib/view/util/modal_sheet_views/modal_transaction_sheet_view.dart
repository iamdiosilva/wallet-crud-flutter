import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

modalTransactionSheetView(BuildContext context) {
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
      initialChildSize: 0.4,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: const [],
          ),
        );
      },
    ),
  );
}
