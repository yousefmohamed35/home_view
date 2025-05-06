import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/core/service/service_locator.dart';
import 'package:homeview/home/data/repos/home_repo_impl.dart';
import 'package:homeview/home/presentation/manager/added_job_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Addedjobcubit(getIt.get<HomeRepoImpl>()),
      child: Scaffold(body: HomeViewBody()),
    );
  }
}
