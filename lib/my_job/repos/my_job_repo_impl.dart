import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/core/model/job_data_model.dart';
import 'package:homeview/core/model/rating_model.dart';
import 'package:homeview/home/data/models/home_model/job_model.dart';
import 'package:homeview/home/presentation/view/widgets/ids.dart';
import 'package:homeview/my_job/model/last_work_model.dart';
import 'package:homeview/my_job/repos/my_job_repo.dart';
import '../../core/service/api_service.dart';
import '../model/applied_job_model.dart';

class MyJobRepoImpl implements MyJobRepo {
  final ApiService apiService;

  MyJobRepoImpl({required this.apiService});
  @override
  Future<RatingModel> getAllCompanyRating({required String companyId}) async {
    var data = await apiService.get(endPoint: 'Company/GetRating/$companyId');
    RatingModel rating = RatingModel.fromJson(data['data']);
    return rating;
  }

  @override
  Future<List<JobDataModel>> getAllJobs({required String memberId}) async {
    var response = await apiService.get(
      endPoint: 'Member/GetAllSavedJobs/$memberId',
      token: Ids.token,
    ); // Corrected the variable name
    log(response.toString());
    List<dynamic> dataList = response['data'];
    log(dataList.toString());
    List<JobDataModel> jobs =
        dataList.map((job) => JobDataModel.fromJson(job)).toList();

    return (jobs);
  }

  @override
  Future<Either<Failure, List<JobModel>>> getAllSavedJob({
    required String memberId,
  }) async {
    try {
      final jobsResult = await getAllJobs(memberId: memberId);
      List<JobModel> mergedJobs = [];
      for (var job in jobsResult) {
        var rating = await getAllCompanyRating(companyId: job.companyId);
        mergedJobs.add(JobModel(jobDataModel: job, ratingModel: rating));
      }
      return right(mergedJobs);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppliedJobModel>>> getAllAppliedJob({
    required String memberId,
  }) async {
    try {
      var response = await apiService.get(
        endPoint: 'Member/GetAllMyJobApplications/$memberId',
        token: Ids.token,
      ); // Corrected the variable name
      log(response.toString());
      List<dynamic> dataList = response['data'];
      List<AppliedJobModel> jobs =
          dataList.map((job) => AppliedJobModel.fromJson(job)).toList();

      return right(jobs);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LastWorkModel>>> getLastWork() async {
    try {
      var response = await apiService.get(
        endPoint: 'Member/GetLastWork',
        token: Ids.token,
      );

      List<dynamic> dataList = response['data'];
      List<LastWorkModel> jobs =
          dataList.map((job) => LastWorkModel.fromJson(job)).toList();
      return right(jobs);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addRate({
    required String companyId,
    required String memberId,
    required Map<String, dynamic> body,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: 'Member/AddRating/$companyId?RatedById=$memberId',
        token: Ids.token,
        body: body,
      );
      dynamic message = response['message'];
      return right(message);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
