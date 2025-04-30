import 'package:homeview/home/data/models/home_model/rating_model.dart';

import 'data.dart';

class HomeModel {
  final bool isSuccess;
  final int statusCode;
  final String message;
  final Data data;
  final RatingModel rating;
  HomeModel( {
    required this.isSuccess,
    required this.statusCode,
    required this.message,
    required this.data, required this.rating,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json,RatingModel rating) => HomeModel(
    rating:rating,
    isSuccess: json['isSuccess'],
    statusCode: json['statusCode'],
    message: json['message'],
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'isSuccess': isSuccess,
    'statusCode': statusCode,
    'message': message,
    'data': data.toJson(),
  };
}
