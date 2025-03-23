import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';
import 'package:homeview/search/presentation/view/widgets/sort_by_section.dart';
import 'package:homeview/search/presentation/view/widgets/job_type_section.dart';
import 'package:homeview/search/presentation/view/widgets/salary_section.dart';
import 'package:homeview/search/presentation/view/widgets/area_section.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterView> {
  String sortBy = 'Latest';
  String jobType = 'Full Time';
  String area = 'Choose';
  double minSalary = 0;
  double maxSalary = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: Text('Filter', style: TextStyle(color: AppColors.blue, fontSize: 23)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.borderColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Sort By
              SortBySection(
                sortBy: sortBy,
                onSortChanged: (value) => setState(() => sortBy = value),
              ),

              // Section: Job Type
              SizedBox(height: 16),
              JobTypeSection(
                jobType: sortBy,
                onJobTypeChanged: (value) => setState(() => sortBy = value),
              ),

              // Section: Salary
              SizedBox(height: 16),
              SalarySection(
                minSalary: minSalary,
                maxSalary: maxSalary,
                onMinSalaryChanged: (value) => setState(() => minSalary = value),
                onMaxSalaryChanged: (value) => setState(() => maxSalary = value),
              ),

              // Section: Area
              SizedBox(height: 16),
              AreaSection(
                area: area,
                onAreaChanged: (value) => setState(() => area = value ?? 'Choose'),
              ),

              // Button: Show Results
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Show results logic here
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.blue),
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text('Show Results', style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}