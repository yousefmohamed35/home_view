import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import 'home_view_item_top.dart';
import 'information_item.dart';

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.5, color: AppColors.grey500),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              HomeViewItemTop(),
              Divider(
                color: Color(0xff95948F),
                indent: 10,
                endIndent: 10,
                height: 20,
              ),
              InformationItem(text: 'cairo', icon: Icons.location_on_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
