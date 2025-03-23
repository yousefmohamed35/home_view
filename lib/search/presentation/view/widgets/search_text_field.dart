import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFilterPressed;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: AppColors.borderColor),
        suffixIcon: GestureDetector(
          onTap: onFilterPressed,
          child: Icon(Icons.tune, color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}