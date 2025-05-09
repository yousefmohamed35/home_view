import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/home/data/models/home_model/job_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';
part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(this.homeRepo) : super(HomeViewInitial());
  final HomeRepo homeRepo;
  List<JobModel> allJobs = []; // كل الوظائف الأصلية
  List<JobModel> filteredJobs = [];
  Future<void> getAllJob() async {
    emit(HomeViewLoading());
    var result = await homeRepo.getAllJob();

    result.fold(
      (fail) {
        emit(HomeViewFailure(errorMessage: fail.errorMessage));
      },
      (jobs) {
        allJobs = jobs;
        filteredJobs = jobs;
        emit(HomeViewSuccess(jobs: filteredJobs));
      },
    );
  }

  void search(String query) {
     final filteredJobs = allJobs.where((job) {
        return job.jobDataModel.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    emit(HomeViewSuccess(jobs: filteredJobs));
  }
}
