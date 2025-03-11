import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/styles.dart';

class CompanyReviewTitle extends StatelessWidget {
  const CompanyReviewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Company review',
            style: GoogleFonts.lato(
              textStyle: AppStyles.bold20.copyWith(color: AppColors.black),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.blue)),
            ),
            child: Text(
              'View all',
              style: GoogleFonts.lato(
                textStyle: AppStyles.regular14.copyWith(color: AppColors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
