import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'components/login_body.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.baseColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginBody(),
          ],
        ),
      ),
    );
  }
}
