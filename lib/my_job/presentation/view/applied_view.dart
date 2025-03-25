import 'package:flutter/material.dart';

import 'package:homeview/my_job/presentation/view/widgets/applied_job_item.dart';

class AppliedView extends StatelessWidget {
  const AppliedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [AppliedJobItem()]),
      ),
    );
  }
}
