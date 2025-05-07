import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/my_job/presentation/manager/my_job_cubit.dart';
import 'package:homeview/my_job/repos/my_job_repo_impl.dart';
import '../../../core/service/service_locator.dart';
import '../../function/my_job_app_bar.dart';
import '../manager/aplied_job_cubit.dart';
import 'widgets/my_job_view_body.dart';

class MyJobView extends StatelessWidget {
  const MyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MyJobCubit>(
          create: (context) => MyJobCubit(getIt<MyJobRepoImpl>())..getAllJob(memberId: 'de8e0174-afdd-4079-8560-9069635d13b9'),
        ),
        BlocProvider<ApliedJobCubit>(
          create: (context) => ApliedJobCubit(getIt<MyJobRepoImpl>())..getAllAppliedJob(memberId: '50fb5984-9dae-488e-9b6f-1e90c696ff65'),
        ),
      ],
      child: Scaffold(appBar: buildMyJobAppBar(context), body: MyJobViewBody()),
    );
  }
}
