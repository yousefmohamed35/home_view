import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import 'custom_step_circle.dart';

class CustomStep extends StatelessWidget {
  const CustomStep({
    super.key,
    required this.title,
    required this.index,
    required this.activeStep,
    required this.length,
  });
  final String title;
  final int index;
  final int activeStep;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CustomStepCircle(index: index, activeStep: activeStep),
            index != length - 1
                ? Container(width: 3, height: 50, color: AppColors.borderColor)
                : SizedBox(),
          ],
        ),
        SizedBox(width: 8),
        Text(title),
      ],
    );
  }
}
