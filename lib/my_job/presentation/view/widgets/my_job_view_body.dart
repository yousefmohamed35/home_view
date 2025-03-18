import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import 'custom_tap_bar_button.dart';

class MyJobViewBody extends StatelessWidget {
  const MyJobViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.blue,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            spacing: 10,
            children: List.generate(3, (index) {
              return Expanded(child: CustomTapBarButton());
            }),
          ),
        ),
      ],
    );
  }
}

