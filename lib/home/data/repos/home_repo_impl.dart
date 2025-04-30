import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/core/service/api_service.dart';
import 'package:homeview/home/data/models/home_model/datum.dart';
import 'package:homeview/home/data/models/home_model/job_model.dart';
import 'package:homeview/home/data/models/home_model/rating_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';
import '../models/home_model/home_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<List<Datum>> getAllJopPosts() async {
    var data = await apiService.get(
      endPoint: 'Home/GetRandomJobs',
    ); // Corrected the variable name
    HomeModel allData = HomeModel.fromJson(data);
    List<Datum> jobs = allData.data.data;
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
        mergedJobs.add(JobModel(datum: job, ratingModel: rating));
      }
      return right(mergedJobs);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
