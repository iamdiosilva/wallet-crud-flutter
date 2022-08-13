import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.white54,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
