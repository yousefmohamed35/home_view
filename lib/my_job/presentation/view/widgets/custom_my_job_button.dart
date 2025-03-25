import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/styles.dart';

class CustomMyJobButton extends StatelessWidget {
  const CustomMyJobButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blue,
        border: Border.all(color: Color(0xff20446A), width: 2),
      ),
      child: Text(
        'Submit',
        style: GoogleFonts.lato(
          textStyle: AppStyles.medium20.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
