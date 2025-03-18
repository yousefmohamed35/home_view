import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.isSelected})
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.white,
      radius: 36,
      child: CircleAvatar(
        backgroundColor: isSelected?AppColors.blue :AppColors.black,
        radius: 30,
        child: Icon(Icons.business_center_outlined, color: AppColors.main),
      ),
    );
  }
}
