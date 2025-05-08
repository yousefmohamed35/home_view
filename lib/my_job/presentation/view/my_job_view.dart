import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/my_job/presentation/manager/aplied_job_cubit.dart';
import 'package:homeview/my_job/presentation/manager/my_job_cubit.dart';
import 'package:homeview/my_job/repos/my_job_repo_impl.dart';
import '../../../core/service/service_locator.dart';
import '../../../home/presentation/view/widgets/ids.dart';
import '../../function/my_job_app_bar.dart';
import 'widgets/my_job_view_body.dart';

class MyJobView extends StatelessWidget {
  const MyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  MyJobCubit(getIt.get<MyJobRepoImpl>())
                    ..getAllJob(memberId: Ids.memberId),
        ),
        BlocProvider(
          create:
              (context) =>
                  ApliedJobCubit(getIt.get<MyJobRepoImpl>())
                    ..getAllAppliedJob(memberId: Ids.memberId),
        ),
      ],
      child: Scaffold(appBar: buildMyJobAppBar(context), body: MyJobViewBody()),
    );
  }
}
