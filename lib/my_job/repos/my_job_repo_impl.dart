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
  Future<List<JobDataModel>> getAllJobs({required String memberId}) async {
    var response = await apiService.get(
      endPoint: 'Member/GetAllSavedJobs/$memberId',
    ); // Corrected the variable name

    List<dynamic> dataList = response['data']['data'];
    List<JobDataModel> jobs =
        dataList.map((job) => JobDataModel.fromJson(job)).toList();

    return (jobs);
  }

  @override
  Future<Either<Failure, List<JobModel>>> getAllSavedJob({required String memberId}) async {
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
}