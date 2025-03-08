import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/styles.dart';

class TrendingNowItem extends StatelessWidget {
  const TrendingNowItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.access_alarm),
          SizedBox(width: 8),
          Text(
            'Trending Now',
            style: GoogleFonts.lato(textStyle: AppStyles.regular10),
          ),
        ],
      ),
    );
  }
}
