import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeview/core/styles.dart';

import '../../../core/app_colors.dart';

import '../../../home/presentation/view/widgets/home_view_item_top.dart';
import 'widgets/custom_my_job_button.dart';
import 'widgets/custom_text_field_last_work_view.dart';

class LastWorkView extends StatelessWidget {
  const LastWorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 0.5, color: AppColors.borderColor),
            ),
            child: Column(
              children: [
                HomeViewItemTop(),
                Divider(
                  color: Color(0xff95948F),
                  indent: 10,
                  endIndent: 10,
                  height: 20,
                ),
                Text(
                  'Rate your Last experience with us!',
                  style: GoogleFonts.lato(textStyle: AppStyles.medium18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(Icons.star);
                  }),
                ),
                CustomTextFieldLastWorkView(),
                CustomMyJobButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

