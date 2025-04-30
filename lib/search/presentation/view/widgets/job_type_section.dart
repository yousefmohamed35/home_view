import 'package:flutter/material.dart';
import 'package:homeview/search/presentation/view/widgets/filter_button.dart';

class JobTypeSection extends StatelessWidget {
  final String jobType;
  final Function(String) onJobTypeChanged;

  const JobTypeSection({
    super.key,
    required this.jobType,
    required this.onJobTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FilterButton(
              text: 'Full Time',
              value: 'Full Time',
              selectedValue: jobType,
              onPressed: (value) => onJobTypeChanged(value),
            ),
            SizedBox(width: 8),
            FilterButton(
              text: 'Part Time',
              value: 'Part Time',
              selectedValue: jobType,
              onPressed: (value) => onJobTypeChanged(value),
            ),
          ],
        ),
      ],
    );
  }
}
