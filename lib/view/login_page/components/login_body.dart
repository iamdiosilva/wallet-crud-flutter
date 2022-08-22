import 'package:flutter/material.dart';

import '../../../controller/login_page_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/theme/app_text_styles.dart';

// ignore: must_be_immutable
class LoginBody extends StatefulWidget {
  LoginBody({Key? key}) : super(key: key);

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final loginController = LoginPageController();

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () async => await widget.loginController.checkUser(
                        context: context,
                        userName: widget._userController.text,
                        password: widget._passController.text,
                      ),
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
}
