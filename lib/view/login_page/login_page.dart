import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../models/user_model.dart';
import '../../repositories/user_repository.dart';
import '../home_page/home_page.dart';
import '../util/custom_snackbar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  late UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    _userRepository = context.watch<UserRepository>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.baseColor,
        body: Column(
          children: [
            Form(
              child: TextFormField(
                controller: _userController,
              ),
            ),
            Form(
              child: TextFormField(
                controller: _passController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  _checkUser(_userController.text, _passController.text, context);
                },
                child: Text('Login')),
          ],
        ),
      ),
    );
  }

  _checkUser(String userName, String password, BuildContext context) async {
    showCustomSnackbar(
      scaffoldContext: context,
      color: AppColors.warning,
      durationMilliseconds: 3000,
      title: 'Requesting server',
      subtitle: 'Comunicating with server',
      trailingImagePath: AppIcons.warning,
    );

    final response = await _userRepository.searchUser(_userController.text);
    await Future.delayed(const Duration(milliseconds: 1000));

    if (response.status == 500) {
      showCustomSnackbarReplace(
        scaffoldContext: context,
        color: AppColors.error,
        durationMilliseconds: 3000,
        title: 'Comunication error',
        subtitle: 'Something went wrong',
        trailingImagePath: AppIcons.wrong,
      );
    } else if (response.status == 200) {
      if (_userRepository.user.userName == userName && _userRepository.user.userPassword == password) {
        showCustomSnackbarReplace(
          scaffoldContext: context,
          color: AppColors.success,
          durationMilliseconds: 3000,
          title: 'Login Successful',
          subtitle: 'Login successful with user ${_userRepository.user.nickname}',
          trailingImagePath: AppIcons.check,
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        showCustomSnackbarReplace(
          scaffoldContext: context,
          color: AppColors.error,
          durationMilliseconds: 3000,
          title: 'Login error',
          subtitle: 'User or password is incorrect',
          trailingImagePath: AppIcons.wrong,
        );
      }
    } else if (response.status == 406) {
      showCustomSnackbarReplace(
        scaffoldContext: context,
        color: AppColors.error,
        durationMilliseconds: 3000,
        title: 'Login error',
        subtitle: 'User or password is incorrect',
        trailingImagePath: AppIcons.wrong,
      );
    }
  }
}
