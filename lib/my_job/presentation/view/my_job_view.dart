import 'package:flutter/material.dart';

import '../../function/my_job_app_bar.dart';

class MyJobView extends StatelessWidget {
  const MyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildMyJobAppBar());
  }
}
