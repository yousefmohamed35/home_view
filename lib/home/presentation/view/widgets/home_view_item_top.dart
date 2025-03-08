import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeview/core/styles.dart';

import 'title_widget.dart';
import 'trending_now_item.dart';

class HomeViewItemTop extends StatelessWidget {
  const HomeViewItemTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingNowItem(),
            TitleWidget(),
            Text(
              'Rog Web',
              style: GoogleFonts.lato(textStyle: AppStyles.regular14),
            ),
          ],
        ),
        Container(width: 74, height: 64, color: Colors.white),
      ],
    );
  }
}
