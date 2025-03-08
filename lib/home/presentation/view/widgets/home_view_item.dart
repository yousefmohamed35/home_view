import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeview/core/styles.dart';

import '../../../../core/app_colors.dart';
import 'title_widget.dart';
import 'trending_now_item.dart';

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
      child: Column(
        children: [
          TrendingNowItem(),
          TitleWidget(),
        ],
      ),
    );
  }
}

