import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/theme/app_icons.dart';

showCustomSnackbar({
  required BuildContext scaffoldContext,
  required Color color,
  required int durationMilliseconds,
  required String leadingImagePath,
  required String trailingLottiePath,
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
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              leadingImagePath,
              width: 45,
            ),
          ),
          title: Text('Title'),
          subtitle: Text('Subtitle'),
          trailing: Lottie.asset(
            trailingLottiePath,
          ),
        ),
      ),
    ),
  );
}
