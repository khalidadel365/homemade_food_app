import 'package:dio/dio.dart';

class ApiService {
  static Dio? dio;

  void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://10.0.2.2:8000',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio?.options.headers = {
      if (token != null) 'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    };

    var response = await dio!.get(
      endPoint,
      queryParameters: queryParameters,
    );

    return response.data;
  }

  Future<Response>? postData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) {
    dio?.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return dio?.post(
      endpoint,
      data: data,
      queryParameters: query,
    );
  }
  Future<Response>? patchData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    required String? token,
  }) {
    dio?.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return dio?.patch(
      endpoint,
      data: data,
      queryParameters: query,
    );
  }
}