import 'package:dio/dio.dart';

class ApiService {
  static Dio? dio;

  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://wobble-froth-polish.ngrok-free.dev',
      //baseUrl: 'http://10.0.2.2:8000',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<dynamic> get({
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

  Future<dynamic> postData({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    print("🌍 Request URL: ${dio!.options.baseUrl}$endpoint");
    print("📦 Request Body: $data");
    print("🔑 Request Headers: ${token != null ? 'Token $token' : 'No Token'}");

    final response = await dio!.post(
      endpoint,
      data: data,
      queryParameters: query,
      options: Options(headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Token $token',
      }),
    );
    return response.data;
  }

  Future<Response>? patchData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    required String? token,
  }) {
    dio?.options.headers = {
      'Authorization': 'Token $token',
      'Content-Type': 'application/json',
    };
    return dio?.patch(
      endpoint,
      data: data,
      queryParameters: query,
    );
  }
}