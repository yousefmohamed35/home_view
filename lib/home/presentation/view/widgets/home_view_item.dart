import 'package:flutter/material.dart';
import 'package:homeview/home/presentation/view/job_description_view.dart';
import 'package:homeview/home/presentation/view/widgets/custom_button.dart';
import '../../../../core/app_colors.dart';
import 'custom_rating.dart';
import 'home_view_item_top.dart';
import 'information_item.dart';

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.5, color: AppColors.borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              HomeViewItemTop(),
              Divider(
                color: Color(0xff95948F),
                indent: 10,
                endIndent: 10,
                height: 20,
              ),
              InformationItem(text: 'cairo', icon: Icons.location_on_outlined),
              SizedBox(height: 10),
              InformationItem(text: 'Full time', icon: Icons.schedule),
              SizedBox(height: 10),
              InformationItem(text: '6000 EGP/Month', icon: Icons.money_sharp),
              SizedBox(height: 10),
              CustomRating(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(text: 'Save', isIcon: true),
                  CustomButton(
                    text: 'View',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return JobDescriptionView();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
