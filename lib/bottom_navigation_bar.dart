import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeview/core/app_colors.dart';
import 'package:homeview/core/styles.dart';
import 'package:homeview/home/presentation/view/home_view.dart';

import 'home/presentation/view/widgets/custom_floating_action_button.dart';
import 'my_job/presentation/view/my_job_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  static List<Widget> _pages = [
    const HomeView(),
    const SizedBox(),
    MyJobView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        isSelected: _selectedIndex == 2,
        onTap: () {
          _onItemTapped(2);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "Home", 0),
            _buildNavItem(Icons.person, "Profile", 1),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Icon(icon, color: AppColors.blue)
          else
            Icon(icon, color: AppColors.black),
          Text(
            label,
            style: GoogleFonts.lato(
              textStyle: AppStyles.medium14.copyWith(
                color: isSelected ? AppColors.blue : null,
              ),
            ),
          ),
          SizedBox(height: 8),
          if (isSelected)
            Container(
              height: 12,
              width: 25,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
              ),
            ),
        ],
      ),
    );
  }
}
