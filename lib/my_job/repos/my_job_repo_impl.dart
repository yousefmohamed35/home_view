import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/core/model/job_data_model.dart';
import 'package:homeview/core/model/rating_model.dart';
import 'package:homeview/home/data/models/home_model/job_model.dart';
import 'package:homeview/my_job/repos/my_job_repo.dart';

import '../../core/service/api_service.dart';

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
  Future<List<JobDataModel>> getAllJobs({
    required String memberId,
    required String endPoints,
  }) async {
    var response = await apiService.get(
      endPoint: 'Member/$endPoints/$memberId',
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImRlOGUwMTc0LWFmZGQtNDA3OS04NTYwLTkwNjk2MzVkMTNiOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJ5b3VzZWYiLCJlbWFpbCI6InlvdXNlZkBnbWFpbC5jb20iLCJqdGkiOiI0ODI4NDRjOS1mMGQ4LTRkOGMtYjRjNS1lNGRlNjRmYjNlNGEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJNZW1iZXIiLCJleHAiOjE3NDc0ODg3ODgsImlzcyI6IlNoaWZ0U3dpZnQuQ29tIiwiYXVkIjoiU2hpZnRTd2lmdCJ9.U55sLk-Id60WPlsGOaFCrymmVIFbnoQy3V5G3I4zyMY',
    ); // Corrected the variable name

    List<dynamic> dataList = response['data'];
    List<JobDataModel> jobs =
        dataList.map((job) => JobDataModel.fromJson(job)).toList();

    return (jobs);
  }

  @override
  Future<Either<Failure, List<JobModel>>> getAllSavedJob({
    required String memberId,
    required String endPoints
  }) async {
    try {
      final jobsResult = await getAllJobs(memberId: memberId,endPoints: endPoints);
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
}
