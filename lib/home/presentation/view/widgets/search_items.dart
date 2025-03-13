import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeview/core/app_colors.dart';

import '../../../../core/styles.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Color(0xffE9E9E9),
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.borderColor, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            SearchJobWidget(
              text: 'Search Job',
              prefixIcon: Icons.search_outlined,
              suffixIcon: Icons.tune,
            ),
            Divider(color: Color(0xffCFCFCF), height: 10),
            SearchJobWidget(
              text: 'Type your location',
              prefixIcon: Icons.location_on_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchJobWidget extends StatelessWidget {
  const SearchJobWidget({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.suffixIcon,
  });
  final String text;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(prefixIcon, color: Colors.grey, size: 16),
        SizedBox(width: 3),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.lato(textStyle: AppStyles.regular12),
          ),
        ),
        Icon(suffixIcon, color: Colors.grey), // Filter icon
      ],
    );
  }
}
