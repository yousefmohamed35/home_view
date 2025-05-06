import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeview/home/data/models/home_model/job_added_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';

part 'added_job_state.dart';

class Addedjobcubit extends Cubit<AddedjobState> {
  Addedjobcubit(this.homeRepo) : super(AddedjobcubitInitial());
  final HomeRepo homeRepo;
  Future<void> savedJob({
    required String jobId,
    required String memberId,
  }) async {
    emit(AddedjobcubitLoading());
    var result = await homeRepo.addSavedJobs(jobId: jobId, memberId: memberId);
    result.fold(
      (fail) {
        emit(AddedjobcubitFailure(erorrMessage: fail.errorMessage));
      },
      (success) {
        emit(AddedjobcubitSuccess(jobAddedModel: success));
      },
    );
  }
}
