import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class AppliedJobStepper extends StatefulWidget {
  const AppliedJobStepper({super.key});

  @override
  State<AppliedJobStepper> createState() => _AppliedJobStepperState();
}

int activeStep = 1;

class _AppliedJobStepperState extends State<AppliedJobStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: AppColors.borderColor),
      ),
      child: CustomStepCircle(),
    );
  }
}

