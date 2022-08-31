import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../util/draggable_incator_component.dart';

modalTransactionSheetView(BuildContext context, Widget page) {
  Navigator.pop(context);
  return showModalBottomSheet(
    backgroundColor: AppColors.baseColor,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        expand: false,
        minChildSize: 0.4,
        initialChildSize: 0.5,
        maxChildSize: 0.6,
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
                  page,
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
