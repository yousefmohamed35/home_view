import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/home/data/models/home_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(this.homeRepo) : super(HomeViewInitial());
  final HomeRepo homeRepo;
  Future<void> getAllJobPosts() async {
    emit(HomeViewLoading());
    var result = await homeRepo.getAllJopPosts();
    result.fold(
      (fail) {
        emit(HomeViewFailure(errorMessage: fail.errorMessage));
      },
      (jobs) {
        emit(HomeViewSuccess(jobs: jobs));
      },
    );
  }
}
