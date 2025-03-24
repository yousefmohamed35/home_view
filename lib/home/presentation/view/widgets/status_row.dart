import 'package:flutter/material.dart';

class StatusRowWidget extends StatelessWidget {
  const StatusRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatusContainer(
          text: "3 Hours Ago",
          textColor: Colors.black54,
          borderColor: Colors.grey.shade400,
        ),

        _buildStatusContainer(
          text: "33 Applicants",
          textColor: Colors.green,
          borderColor: Colors.green,
        ),

        _buildVerifiedContainer(),
      ],
    );
  }

  Widget _buildStatusContainer({
    required String text,
    required Color textColor,
    required Color borderColor,
  }) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
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
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
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
