 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_colors.dart';
import '../../core/styles.dart';

AppBar buildMyJobAppBar() {
    return AppBar(
      backgroundColor: AppColors.blue,
      title: Text(
        'My Job',
        style: GoogleFonts.lato(
          textStyle: AppStyles.medium20.copyWith(color: AppColors.white),
        ),
      ),
      leading: Icon(Icons.arrow_back_ios, color: AppColors.white),
      titleSpacing: 0,
    );
  }
