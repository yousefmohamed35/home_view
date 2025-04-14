import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/core/service/api_service.dart';
import 'package:homeview/home/data/models/home_model.dart';
import 'package:homeview/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<HomeModel>>> getAllJopPosts() async {
    try {
      var data = await apiService.get(
        endPoint: 'Home/GetRandomJobs',
      ); // Corrected the variable name
      List<HomeModel> jobs = [];
      for (var job in data['data']) {
        jobs.add(HomeModel.fromJson(job));
      }
      return right(jobs);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
