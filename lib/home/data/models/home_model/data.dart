import 'datum.dart';

class Data {
final  List<Datum> data;
final  int currentPage;
final  int totalPages;
final  int totalCount;
final  int pageSize;
final  bool hasPreviousPage;
final  bool hasNextPage;
final  bool isSuccess;
final  int statusCode;
final  dynamic message;



  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data:
        (json['data'] as List<dynamic>?)
            !.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
    currentPage: json['currentPage'],
    totalPages: json['totalPages'],
    totalCount: json['totalCount'] ,
    pageSize: json['pageSize'] ,
    hasPreviousPage: json['hasPreviousPage'],
    hasNextPage: json['hasNextPage'] ,
    isSuccess: json['isSuccess'] ,
    statusCode: json['statusCode'] ,
    message: json['message'] ,
  );

  Data({required this.data, required this.currentPage, required this.totalPages, required this.totalCount, required this.pageSize, required this.hasPreviousPage, required this.hasNextPage, required this.isSuccess, required this.statusCode, required this.message});

  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toJson()).toList(),
    'currentPage': currentPage,
    'totalPages': totalPages,
    'totalCount': totalCount,
    'pageSize': pageSize,
    'hasPreviousPage': hasPreviousPage,
    'hasNextPage': hasNextPage,
    'isSuccess': isSuccess,
    'statusCode': statusCode,
    'message': message,
  };
}
