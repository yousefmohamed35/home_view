import 'package:flutter/material.dart';

import 'applied_job_item.dart';

class AppliedViewBody extends StatelessWidget {
  const AppliedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: AppliedJobItem(),
            );
          }),
        ),
      ),
    );
  }
}
