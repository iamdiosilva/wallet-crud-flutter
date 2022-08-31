import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../core/theme/app_text_styles.dart';

class FilterItemComponent extends StatelessWidget {
  final String label;

  const FilterItemComponent({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.baseColor200,
            ),
            borderRadius: BorderRadius.circular(32),
            color: AppColors.baseColor300,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: AppTextStyles.buttonLabel.copyWith(color: AppColors.white70),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    AppIcons.svgArrowDown,
                    width: 15,
                    color: AppColors.white54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
