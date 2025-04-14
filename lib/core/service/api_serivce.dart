import 'package:dio/dio.dart';

class ApiSerivce {
  final String _baseUrl = 'http://shiftswift.runasp.net/api/';
  final Dio dio;

  ApiSerivce({required this.dio});
  Future<Map<String, String>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
