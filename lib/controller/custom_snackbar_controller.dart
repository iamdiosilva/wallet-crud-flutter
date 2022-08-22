import 'package:flutter/cupertino.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_icons.dart';
import '../view/util/custom_snackbar.dart';

class CustomSnackbarController {
  //request server info snackbar message
  requestServerInfo({required BuildContext context}) {
    showCustomSnackbar(
      scaffoldContext: context,
      color: AppColors.warning,
      durationMilliseconds: 3000,
      title: 'Requesting server',
      subtitle: 'Comunicating with server',
      trailingImagePath: AppIcons.warning,
    );
  }

  //response server info snackbar message
  reponseServerInfo({required BuildContext context, required String title, required String subtitle, required Color color, required String iconPath}) {
    showCustomSnackbar(
      scaffoldContext: context,
      color: color,
      durationMilliseconds: 3000,
      title: title,
      subtitle: subtitle,
      trailingImagePath: iconPath,
    );
  }

  //response server info snackbar replacement message
  reponseServerInfoReplacement(
      {required BuildContext context, required String title, required String subtitle, required Color color, required String iconPath}) {
    showCustomSnackbarReplacement(
      scaffoldContext: context,
      color: color,
      durationMilliseconds: 3000,
      title: title,
      subtitle: subtitle,
      trailingImagePath: iconPath,
    );
  }
}
