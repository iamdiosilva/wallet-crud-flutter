import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../repositories/user_repository.dart';
import '../../home_page/home_page.dart';
import '../../util/custom_snackbar.dart';

// ignore: must_be_immutable
class LoginBody extends StatefulWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  late UserRepository _userRepository;

  LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    widget._userRepository = context.watch<UserRepository>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.baseColor500,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Login ', style: AppTextStyles.homeLabelBold),
                      Text('Wallet', style: AppTextStyles.homeLabel),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const SizedBox(
                        height: 30,
                        width: 30,
                      ),
                      Positioned(
                        top: -60,
                        right: -10,
                        child: Image.asset(
                          AppImages.wallet,
                          width: 80,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),

              //User form field
              Form(
                child: TextFormField(
                  controller: widget._userController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'User',
                    labelStyle: AppTextStyles.textFormLabel,
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.white38,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white38,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white70,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //password form field
              Form(
                child: TextFormField(
                  obscureText: true,
                  controller: widget._passController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: AppTextStyles.textFormLabel,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.white38,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white38,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white70,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.all(AppColors.baseColor200),
                    value: rememberMe,
                    onChanged: (value) => setState(() {
                      rememberMe = !rememberMe;
                    }),
                  ),
                  Text('Remember me', style: AppTextStyles.listTileSubtitle),
                ],
              ),
              const SizedBox(height: 10),

              //login button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.success,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () async => await _checkUser(widget._userController.text, widget._passController.text, context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: AppColors.baseColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  //check if user is valid and login
  _checkUser(String userName, String password, BuildContext context) async {
    showCustomSnackbar(
      scaffoldContext: context,
      color: AppColors.warning,
      durationMilliseconds: 3000,
      title: 'Requesting server',
      subtitle: 'Comunicating with server',
      trailingImagePath: AppIcons.warning,
    );

    final response = await widget._userRepository.searchUser(widget._userController.text);
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
      if (widget._userRepository.user.userName == userName && widget._userRepository.user.userPassword == password) {
        showCustomSnackbarReplace(
          scaffoldContext: context,
          color: AppColors.success,
          durationMilliseconds: 3000,
          title: 'Login Successful',
          subtitle: 'Welcome ${widget._userRepository.user.nickname}!',
          trailingImagePath: AppIcons.check,
        );
        // ignore: use_build_context_synchronously
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
