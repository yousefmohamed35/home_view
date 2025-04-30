import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/styles.dart';
import '../../../../home/presentation/view/widgets/custom_rating.dart';
import '../../../../home/presentation/view/widgets/home_view_item_top.dart';
import '../../../../home/presentation/view/widgets/information_item.dart';
import 'applied_job_stepper.dart';

class AppliedJobItem extends StatelessWidget {
  const AppliedJobItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.5, color: AppColors.borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeViewItemTop(title: ''),
                Divider(
                  color: Color(0xff95948F),
                  indent: 10,
                  endIndent: 10,
                  height: 20,
                ),
                InformationItem(
                  text: 'cairo',
                  icon: Icons.location_on_outlined,
                ),
                SizedBox(height: 10),
                InformationItem(text: 'Full time', icon: Icons.schedule),
                SizedBox(height: 10),
                InformationItem(
                  text: '6000 EGP/Month',
                  icon: Icons.money_sharp,
                ),
                SizedBox(height: 10),
                CustomRating(),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Color(0xff4DD206).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Icon(Icons.verified, size: 16, color: Color(0xff0D9300)),
                      SizedBox(width: 8),
                      Text(
                        'Application Sent 1d Ago',
                        style: GoogleFonts.lato(
                          textStyle: AppStyles.regular14.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        AppliedJobStepper(),
      ],
    );
  }
}
