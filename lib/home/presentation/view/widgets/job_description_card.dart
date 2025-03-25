import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class JobDescriptionCard extends StatelessWidget {
  const JobDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColors.grey200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0.5,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Job Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ..._buildJobResponsibilities(),
              Divider(),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _jobDetail(Icons.location_on, "Location", "Cairo"),
                  _jobDetail(Icons.access_time, "Job Type", "Full Time"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _jobDetail(Icons.person, "Gender", "Male/Female"),
                  Spacer(),
                  _jobDetail(
                    Icons.money,
                    "Salary",
                    "6000-9000 EGP/Month",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<Widget> _buildJobResponsibilities() {
    List<String> responsibilities = [
      "Responding to customer questions and providing the required information",
      "Assisting customers in solving any problems they encounter with products or services",
      "Logging customer complaints and working to find solutions",
      "Informing customers about offers",
    ];
    return responsibilities.map(
      (text) => Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              size: 8,
              color: AppColors.grey400,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    ).toList();
  }
  Widget _jobDetail(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.blue),
        SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            Text(
              value,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
