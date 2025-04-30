import 'package:flutter/material.dart';
import 'package:homeview/core/app_colors.dart';

class RequirementsCard extends StatelessWidget {
  const RequirementsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColors.grey200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0.5,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Requirements",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ..._buildRequirementsList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRequirementsList() {
    List<String> requirements = [
      "Responding to customer questions and providing the required information",
      "Assisting customers in solving any problems they encounter with products or services",
      "Logging customer complaints and working to find solutions",
      "Informing customers about offers",
    ];

    return requirements
        .map(
          (text) => Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: AppColors.grey400),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
