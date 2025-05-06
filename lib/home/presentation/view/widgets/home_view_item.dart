import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/home/data/models/home_model/job_model.dart';
import 'package:homeview/home/presentation/manager/added_job_cubit.dart';
import 'package:homeview/home/presentation/view/job_description_view.dart';
import 'package:homeview/home/presentation/view/widgets/custom_button.dart';
import '../../../../core/app_colors.dart';
import 'custom_rating.dart';
import 'home_view_item_top.dart';
import 'information_item.dart';

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({super.key, required this.job});
  final JobModel job;
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
              HomeViewItemTop(
                title: job.datum.title,
                companyName: job.datum.companyName,
              ),
              Divider(
                color: Color(0xff95948F),
                indent: 10,
                endIndent: 10,
                height: 20,
              ),
              InformationItem(
                text: job.datum.location,
                icon: Icons.location_on_outlined,
              ),
              SizedBox(height: 10),
              InformationItem(
                text: job.datum.jobTypeTd.name,
                icon: Icons.schedule,
              ),
              SizedBox(height: 10),
              InformationItem(
                text:
                    "${job.datum.salary.toStringAsFixed(0)} EGP/${job.datum.salaryTypeId.name}",
                icon: Icons.money_sharp,
              ),
              SizedBox(height: 10),
              CustomRating(
                rating: job.ratingModel.averageScore.toString(),
                review: job.ratingModel.ratings!.length,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<Addedjobcubit, AddedjobState>(
                    listener: (context, state) {
                      if (state is AddedjobcubitSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.jobAddedModel.message!)),
                        );
                      }
                      if (state is AddedjobcubitFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Job is already saved')),
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        text: 'Save',
                        isIcon: true,
                        onTap: () {
                          BlocProvider.of<Addedjobcubit>(context).savedJob(
                            jobId: job.datum.id,
                            
                            memberId: 'ffee3bb9-8cc6-492a-9d4d-7c2d0741b4fb',
                          );
                        },
                      );
                    },
                  ),
                  CustomButton(
                    text: 'View',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return JobDescriptionView(
                              job: job.datum,
                              rating: job.ratingModel,
                            );
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
