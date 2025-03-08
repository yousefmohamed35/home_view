import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import 'home_view_item_top.dart';

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5, color: AppColors.grey500),
      ),
      child: HomeViewItemTop(),
    );
  }
}
