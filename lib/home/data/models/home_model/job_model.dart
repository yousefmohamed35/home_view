import 'package:homeview/core/model/rating_model.dart';
import '../../../../core/model/job_data_model.dart';

class JobModel {
  final JobDataModel jobDataModel;
  final RatingModel ratingModel;

  JobModel({required this.jobDataModel, required this.ratingModel});
}
