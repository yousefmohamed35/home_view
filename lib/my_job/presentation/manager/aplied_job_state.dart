import '../../../home/data/models/home_model/job_model.dart';

abstract class AppliedJobState {}

class AppliedJobInitial extends AppliedJobState {}

class AppliedJobLoading extends AppliedJobState {}
class AppliedJobSuccess extends AppliedJobState {
  final List<JobModel> jobs;
  AppliedJobSuccess({required this.jobs});
}

class AppliedJobFailure extends AppliedJobState {
  final String errorMessage;
  AppliedJobFailure({required this.errorMessage});
}