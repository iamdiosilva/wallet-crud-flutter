import 'package:flutter/material.dart';

import '../../core/theme/app_text_styles.dart';

class BoxButtonModel extends StatelessWidget {
  final String iconPath;
  final String labelText;

  const BoxButtonModel({
    Key? key,
    required this.iconPath,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Image.asset(
              iconPath,
              width: 64,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          labelText,
          style: AppTextStyles.buttonLabel,
        ),
      ],
    );
  }
}
