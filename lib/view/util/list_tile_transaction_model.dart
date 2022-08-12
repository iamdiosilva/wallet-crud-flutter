import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_crud/core/theme/app_icons.dart';

import '../../core/theme/app_colors.dart';

import '../../core/theme/app_text_styles.dart';

class ListTileTransactionModel extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  Function()? action;

  ListTileTransactionModel({
    Key? key,
    this.action,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
      child: GestureDetector(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.baseColor200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.asset(
                    imagePath,
                    width: 64,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.listTileTitle,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subTitle,
                      style: AppTextStyles.listTileSubtitle,
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  AppIcons.svgArrowUp,
                  height: 22,
                  color: AppColors.white54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
