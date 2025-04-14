import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import 'package:homeview/home/data/models/home_model.dart';

abstract class HomeRepo {
 Future<Either<Failure,List<HomeModel>>> getAllJopPosts();
}
