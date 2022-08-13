import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../core/theme/app_text_styles.dart';

class ListTileFunctionModel extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  Function()? action;

  ListTileFunctionModel({
    Key? key,
    this.action,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.baseColor200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Image.asset(imagePath),
            title: Text(title, style: AppTextStyles.listTileTitle),
            subtitle: Text(subTitle, style: AppTextStyles.listTileSubtitle),
            trailing: action != null
                ? SvgPicture.asset(
                    AppIcons.svgArrowUp,
                    width: 22,
                    color: AppColors.white54,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
