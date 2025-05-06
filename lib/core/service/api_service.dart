import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'http://shiftswift.tryasp.net/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required String token,
    Map<String, String>? header,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      options: Options(
  
        headers: header ?? {'Authorization': 'Bearer $token'},
      ),
    );
    return response.data;
  }
}
