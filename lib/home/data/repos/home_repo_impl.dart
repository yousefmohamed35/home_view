import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/core/service/api_service.dart';
import 'package:homeview/home/data/models/home_model/job_added_model.dart';
import 'package:homeview/home/data/models/home_model/job_model.dart';
import 'package:homeview/core/model/rating_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';
import '../../../core/model/job_data_model.dart';
import '../../presentation/view/widgets/ids.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<List<JobDataModel>> getAllJopPosts() async {
    var response = await apiService.get(
      endPoint:
          'Home/GetRandomJobs?PageNumber=1&PageSize=10&SortBy=JobType&SortOrder=asc&JobTypeIdFilterValue=0&SalaryTypeIdFilterValue=0',
    ); // Corrected the variable name

    List<dynamic> dataList = response['data']['data'];
    List<JobDataModel> jobs =
        dataList.map((job) => JobDataModel.fromJson(job)).toList();

    return (jobs);
  }

  @override
  Future<RatingModel> getAllCompanyRating({required String companyId}) async {
    var data = await apiService.get(
      endPoint: 'Company/GetRating?companyId=$companyId',
    );
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
        token: Ids.token,
      );

      JobAddedModel saveJob = JobAddedModel.fromJson(response);
      return right(saveJob);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, JobAddedModel>> addAppliedJob({
    required Map<String, dynamic> body,
  }) async {
    try {
      var response = await apiService.post(
        endPoint: 'Member/AddJobApplication',
        token: Ids.token,
        body: body,
      );
      JobAddedModel applyJob = JobAddedModel.fromJson(response);
      return right(applyJob);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
