import 'data.dart';

class HomeModel {
  final bool isSuccess;
  final int statusCode;
  final String message;
  final Data data;
  HomeModel( {
    required this.isSuccess,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json,) => HomeModel(
 
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
