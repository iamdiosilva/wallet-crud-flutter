import 'package:flutter/material.dart';
import 'package:wallet_crud/core/theme/app_colors.dart';

import '../core/theme/app_icons.dart';
import '../repositories/user_repository.dart';
import '../view/home_page/home_page.dart';
import 'custom_snackbar_controller.dart';

class LoginPageController {
  //check if user is valid and login
  checkUser({required BuildContext context, required String userName, required String password}) async {
    //custom snackbar controller instance
    final cSnackbarController = CustomSnackbarController();

    cSnackbarController.requestServerInfo(context: context);

    final response = await UserRepository.instance.searchUser(userName);
    await Future.delayed(const Duration(milliseconds: 1000));

    if (response.status == 500) {
      cSnackbarController.reponseServerInfoReplacement(
        context: context,
        color: AppColors.error,
        title: 'Comunication error',
        subtitle: 'Something went wrong',
        iconPath: AppIcons.wrong,
      );
    } else if (response.status == 200) {
      if (UserRepository.instance.user.userName == userName && UserRepository.instance.user.userPassword == password) {
        cSnackbarController.reponseServerInfoReplacement(
            context: context,
            color: AppColors.success,
            title: 'Login success',
            subtitle: 'Welcome back ${UserRepository.instance.user.nickname}!',
            iconPath: AppIcons.check);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        cSnackbarController.reponseServerInfoReplacement(
          context: context,
          color: AppColors.error,
          title: 'Login error',
          subtitle: 'Wrong user or password',
          iconPath: AppIcons.wrong,
        );
      }
    } else if (response.status == 406) {
      cSnackbarController.reponseServerInfoReplacement(
        context: context,
        color: AppColors.error,
        title: 'Login error',
        subtitle: 'Wrong user or password',
        iconPath: AppIcons.wrong,
      );
    }
  }
}
