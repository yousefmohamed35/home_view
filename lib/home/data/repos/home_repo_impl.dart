import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/core/service/api_service.dart';
import 'package:homeview/home/data/models/home_model/job_added_model.dart';
import 'package:homeview/home/data/models/home_model/job_model.dart';
import 'package:homeview/core/model/rating_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';
import '../../../core/model/job_data_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<List<JobDataModel>> getAllJopPosts() async {
    var response = await apiService.get(
      endPoint: 'Home/GetRandomJobs',
    ); // Corrected the variable name

    List<dynamic> dataList = response['data']['data'];
    List<JobDataModel> jobs =
        dataList.map((job) => JobDataModel.fromJson(job)).toList();

    return (jobs);
  }

  @override
  Future<RatingModel> getAllCompanyRating({required String companyId}) async {
    var data = await apiService.get(endPoint: 'Company/GetRating/$companyId');
    RatingModel rating = RatingModel.fromJson(data['data']);
    return rating;
  }

  @override
  Future<Either<Failure, List<JobModel>>> getAllJob() async {
    try {
      final jobsResult = await getAllJopPosts();
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
  Future<Either<Failure, JobAddedModel>> addSavedJobs({
    required String jobId,
    required String memberId,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: 'Member/SaveJob?JobId=$jobId&MemberId=$memberId',
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImRlOGUwMTc0LWFmZGQtNDA3OS04NTYwLTkwNjk2MzVkMTNiOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJ5b3VzZWYiLCJlbWFpbCI6InlvdXNlZkBnbWFpbC5jb20iLCJqdGkiOiI0ODI4NDRjOS1mMGQ4LTRkOGMtYjRjNS1lNGRlNjRmYjNlNGEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJNZW1iZXIiLCJleHAiOjE3NDc0ODg3ODgsImlzcyI6IlNoaWZ0U3dpZnQuQ29tIiwiYXVkIjoiU2hpZnRTd2lmdCJ9.U55sLk-Id60WPlsGOaFCrymmVIFbnoQy3V5G3I4zyMY',
      );

      JobAddedModel saveJob = JobAddedModel.fromJson(response);
      return right(saveJob);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, JobAddedModel>> addAppliedJob({
    required String jobId,
    required String memberId,
    required body,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: 'Member/AddJobApplication',
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImRlOGUwMTc0LWFmZGQtNDA3OS04NTYwLTkwNjk2MzVkMTNiOSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJ5b3VzZWYiLCJlbWFpbCI6InlvdXNlZkBnbWFpbC5jb20iLCJqdGkiOiI0ODI4NDRjOS1mMGQ4LTRkOGMtYjRjNS1lNGRlNjRmYjNlNGEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJNZW1iZXIiLCJleHAiOjE3NDc0ODg3ODgsImlzcyI6IlNoaWZ0U3dpZnQuQ29tIiwiYXVkIjoiU2hpZnRTd2lmdCJ9.U55sLk-Id60WPlsGOaFCrymmVIFbnoQy3V5G3I4zyMY',
        body: body,
      );
      JobAddedModel applyJob = JobAddedModel.fromJson(response);
      return right(applyJob);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
