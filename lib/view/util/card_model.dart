import 'package:flutter/material.dart';

import '../../core/theme/app_text_styles.dart';

class CardModel extends StatelessWidget {
  final Color? color;
  const CardModel({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            Text(
              'Balance',
              style: AppTextStyles.cardText,
            ),
            const SizedBox(height: 10),
            Text(
              'R\$ 4.278,20',
              style: AppTextStyles.balanceText,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Final 123',
                  style: AppTextStyles.cardText,
                ),
                Text(
                  'CCR: 10/09',
                  style: AppTextStyles.cardText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
