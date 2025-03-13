import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/styles.dart';

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
