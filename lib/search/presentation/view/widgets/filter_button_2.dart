import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final String value;
  final String selectedValue;
  final Function(String) onPressed;

  const FilterButton({
    super.key,
    required this.text,
    required this.value,
    required this.selectedValue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressed(value),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return selectedValue == value ? AppColors.blue : AppColors.main;
            },
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedValue == value ? Colors.white : AppColors.blue,
          ),
        ),
      ),
    );
  }
}