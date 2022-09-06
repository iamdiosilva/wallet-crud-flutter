import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class SeparatorDots extends StatelessWidget {
  final double maxLineLength;
  const SeparatorDots({Key? key, required this.maxLineLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: maxLineLength,
      lineThickness: 4,
      dashLength: 4,
      dashColor: Colors.black,
      dashGradient: const [Colors.white, Colors.grey],
      dashRadius: 4,
      dashGapLength: 5,
      dashGapColor: Colors.transparent,
      dashGapRadius: 4,
    );
  }
}
