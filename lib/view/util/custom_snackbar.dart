import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

showCustomSnackbar({
  required BuildContext scaffoldContext,
  required Color color,
  required int durationMilliseconds,
  required String title,
  required String subtitle,
  required String trailingImagePath,
}) {
  ScaffoldMessenger.of(scaffoldContext).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: durationMilliseconds),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        alignment: Alignment.center,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.baseColor200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 25,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.listTileTitle,
                          ),
                          SizedBox(
                            width: MediaQuery.of(scaffoldContext).size.width * 0.6,
                            child: Text(
                              subtitle,
                              style: AppTextStyles.listTileSubtitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Image.asset(
                trailingImagePath,
                width: 45,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

showCustomSnackbarReplace({
  required BuildContext scaffoldContext,
  required Color color,
  required int durationMilliseconds,
  required String title,
  required String subtitle,
  required String trailingImagePath,
}) {
  ScaffoldMessenger.of(scaffoldContext)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: durationMilliseconds),
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          alignment: Alignment.center,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.baseColor200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 25,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: AppTextStyles.listTileTitle,
                            ),
                            SizedBox(
                              width: MediaQuery.of(scaffoldContext).size.width * 0.6,
                              child: Text(
                                subtitle,
                                style: AppTextStyles.listTileSubtitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Image.asset(
                  trailingImagePath,
                  width: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
}
