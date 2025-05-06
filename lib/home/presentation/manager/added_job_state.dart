part of 'added_job_cubit.dart';

abstract class AddedjobState {}

class AddedjobcubitInitial extends AddedjobState {}

class AddedjobcubitLoading extends AddedjobState {}

class AddedjobcubitSuccess extends AddedjobState {
  final JobAddedModel jobAddedModel;

  AddedjobcubitSuccess({required this.jobAddedModel});
}
