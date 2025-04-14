import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/core/app_colors.dart';
import 'package:homeview/core/service/service_locator.dart';
import 'package:homeview/home/data/repos/home_repo_impl.dart';
import 'package:homeview/home/presentation/manager/home_view_cubit.dart';

import 'bottom_navigation_bar.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit(getIt.get<HomeRepoImpl>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CustomBottomNavigationBar(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        ),
      ),
    );
  }
}
