import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/styles.dart';

class CustomTapBarButton extends StatelessWidget {
  const CustomTapBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.borderColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {},
      child: Text(
        'Saved',
        style: GoogleFonts.lato(
          textStyle: AppStyles.regular14.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
