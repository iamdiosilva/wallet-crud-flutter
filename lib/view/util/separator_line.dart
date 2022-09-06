import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class SeparatorLine extends StatelessWidget {
  const SeparatorLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: Colors.black,
      dashGradient: const [Colors.white, Colors.grey],
      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
      dashGapGradient: const [Colors.white, Colors.grey],
      dashGapRadius: 0.0,
    );
  }
}
