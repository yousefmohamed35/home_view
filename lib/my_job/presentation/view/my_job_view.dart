import 'package:flutter/material.dart';
import '../../function/my_job_app_bar.dart';
import 'widgets/my_job_view_body.dart';

class MyJobView extends StatelessWidget {
  const MyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildMyJobAppBar(context), body: MyJobViewBody());
  }
}
