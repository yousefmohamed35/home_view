import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/core/service/api_service.dart';
import 'package:homeview/home/data/models/home_model/datum.dart';
import 'package:homeview/home/data/models/home_model/rating_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';
import '../models/home_model/home_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Datum>>> getAllJopPosts() async {
    try {
      var data = await apiService.get(
        endPoint: 'Home/GetRandomJobs',
      ); // Corrected the variable name
      HomeModel allData = HomeModel.fromJson(data);
      List<Datum> jobs = allData.data.data;
      return right(jobs);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RatingModel>> getAllCompanyRating({
    required String companyId,
  }) async {
    try {
      var data = await apiService.get(endPoint: 'Company/GetRating/$companyId');
      RatingModel rating = RatingModel.fromJson(data['data']);
      return right(rating);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
