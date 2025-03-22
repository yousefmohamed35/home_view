import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeview/core/app_colors.dart';
import 'package:homeview/core/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.isIcon = false, this.onTap});
  final String text;
  final bool isIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 145,
        height: 40,
        decoration: BoxDecoration(
          color: isIcon ? Colors.transparent : AppColors.blue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.blue),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon ? Icon(Icons.pages, color: AppColors.blue) : SizedBox(),
            SizedBox(width: 8),
            Text(
              text,
              style: GoogleFonts.lato(
                textStyle: AppStyles.medium20.copyWith(
                  color: isIcon ? AppColors.blue : AppColors.main,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
