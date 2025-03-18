import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';
import '../../function/my_job_app_bar.dart';
import 'widgets/custom_tap_bar_button.dart';

class MyJobView extends StatelessWidget {
  const MyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMyJobAppBar(),
      body: Column(
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
      ),
    );
  }
}

