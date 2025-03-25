import 'package:flutter/material.dart';

class StatusRowWidget extends StatelessWidget {
  const StatusRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatusContainer(
          text: "3 Hours Ago",
          textColor: Colors.black54,
          borderColor: Colors.grey.shade400,
          width: 65,
        ),
        SizedBox(width: 8),
        _buildStatusContainer(
          text: "33 Applicants",
          textColor: Colors.green,
          borderColor: Colors.green,
          width: 95,
        ),
        SizedBox(width: 8),
        _buildVerifiedContainer(),
      ],
    );
  }

  Widget _buildStatusContainer({
    required String text,
    required Color textColor,
    required Color borderColor,
    required double width,
  }) {
    return Container(
      width: width,
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildVerifiedContainer() {
    return Container(
      width: 140,
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.verified, color: Colors.blue, size: 16),
          SizedBox(width: 5),
          Text(
            "Verified Employer",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}