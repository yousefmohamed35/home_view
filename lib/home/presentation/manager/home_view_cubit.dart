import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/home/data/repos/home_repo.dart';
import '../../data/models/home_model/datum.dart';
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
