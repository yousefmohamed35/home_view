import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.white,
      radius: 36,
      child: CircleAvatar(
        backgroundColor: AppColors.black,
        radius: 30,
        child: Icon(Icons.business_center_outlined, color: AppColors.main),
      ),
    );
  }
}
