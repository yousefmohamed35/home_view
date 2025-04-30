import 'data.dart';

class HomeModel {
  final bool isSuccess;
  final int? statusCode;
  String? message;
  Data? data;

  HomeModel({this.isSuccess, this.statusCode, this.message, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    isSuccess: json['isSuccess'] as bool?,
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data:
        json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'isSuccess': isSuccess,
    'statusCode': statusCode,
    'message': message,
    'data': data?.toJson(),
  };
}
