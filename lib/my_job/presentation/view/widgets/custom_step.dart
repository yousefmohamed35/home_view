import 'package:flutter/material.dart';
import 'custom_step_circle.dart';

class CustomStep extends StatelessWidget {
  const CustomStep({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomStepCircle(),
        SizedBox(width: 8),
        Text(title),
      ],
    );
  }
}
