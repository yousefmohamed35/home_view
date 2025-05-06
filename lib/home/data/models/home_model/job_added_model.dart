class JobAddedModel {
  bool? isSuccess;
  int? statusCode;
  String? message;
  bool? data;

  JobAddedModel({this.isSuccess, this.statusCode, this.message, this.data});

  factory JobAddedModel.fromJson(Map<String, dynamic> json) => JobAddedModel(
    isSuccess: json['isSuccess'] as bool?,
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    data: json['data'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'isSuccess': isSuccess,
    'statusCode': statusCode,
    'message': message,
    'data': data,
  };
}
