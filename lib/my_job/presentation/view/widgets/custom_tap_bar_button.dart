import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/styles.dart';

class CustomTapBarButton extends StatelessWidget {
  const CustomTapBarButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onPressed,
  });
  final String text;
  final bool isSelected;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isSelected ? Color(0xffBDCCDC) : Color(0xffBBB9B3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(width: 2, color: Color(0xff20446A)),
      ),
      onPressed: () {},
      child: Text(
        'Saved',
        style: GoogleFonts.lato(
          textStyle: AppStyles.regular14.copyWith(
            color: isSelected ? AppColors.blue : AppColors.white,
          ),
        ),
      ),
    );
  }
}
