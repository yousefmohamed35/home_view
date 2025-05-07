import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/my_job/presentation/manager/my_job_cubit.dart';
import 'package:homeview/my_job/repos/my_job_repo_impl.dart';
import '../../../core/service/service_locator.dart';
import '../../function/my_job_app_bar.dart';
import 'widgets/my_job_view_body.dart';

class MyJobView extends StatelessWidget {
  const MyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              MyJobCubit(getIt.get<MyJobRepoImpl>())
                ..getAllJob(
                  memberId: 'de8e0174-afdd-4079-8560-9069635d13b9',
                  endPoints: 'GetAllSavedJobs',
                )
                ..getAllJob(
                  memberId: 'de8e0174-afdd-4079-8560-9069635d13b9',
                  endPoints: 'GetAllMyJobApplications',
                ),
      child: Scaffold(appBar: buildMyJobAppBar(context), body: MyJobViewBody()),
    );
  }
}
