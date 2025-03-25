import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeview/core/styles.dart';
import 'package:homeview/my_job/presentation/view/widgets/custom_my_job_button.dart';

import '../../../bottom_navigation_bar.dart';

class NoSavedView extends StatelessWidget {
  const NoSavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/saved.png'),
          Text(
            'No Saved Jobs Yet...! ',
            style: GoogleFonts.lato(textStyle: AppStyles.bold24),
          ),
          Text(
            'Your notification will appear here once you\'vereceived them. ',
            style: GoogleFonts.lato(textStyle: AppStyles.regular14),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          CustomMyJobButton(
            text: 'Go to home',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CustomBottomNavigationBar();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
