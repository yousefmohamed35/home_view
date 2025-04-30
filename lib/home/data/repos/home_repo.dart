import 'package:dartz/dartz.dart';
import 'package:homeview/core/error/failure.dart';
import '../models/home_model/datum.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Datum>>> getAllJopPosts();
}
