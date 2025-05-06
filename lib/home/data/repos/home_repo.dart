import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import '../models/home_model/datum.dart';
import '../models/home_model/job_added_model.dart';
import '../models/home_model/job_model.dart';
import '../models/home_model/rating_model.dart';

abstract class HomeRepo {
  Future<List<Datum>> getAllJopPosts();
  Future<RatingModel> getAllCompanyRating({required String companyId});
  Future<Either<Failure, List<JobModel>>> getAllJob();
    Future<Either<Failure, JobAddedModel>> addSavedJobs({required String jobId,required String memberId});
}
