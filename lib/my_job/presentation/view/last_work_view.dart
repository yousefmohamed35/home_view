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
          LastWorkViewItem(),
        ],
      ),
    );
  }
}

