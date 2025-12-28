import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio ;

  static init (){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000',
        receiveDataWhenStatusError: true
        //receiveDataWhenStatusError: true,
      )
    );
  }

  // static Future<Response>? getData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   String? lang = 'en',
  //   String? token ,
  // }){
  //   dio?.options.headers = {
  //     'lang' : lang,
  //     'Authorization': token ?? '',
  //     'Content-Type' : 'application/json',
  //   };
  //   return dio?.get(
  //       url,  //Method (Which table will get from)
  //       queryParameters: query
  //   );
  // }

  static Future<Response>? postData({
    required String url, //endpoint
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String lang = 'en',
    String?  token
  }
      ){
    dio?.options.headers={
      'lang':lang,
      'Authorization':token?? '', //mlosh lazma fe el login // lw feh het7at
      'Content-Type' : 'application/json',
    };
    return dio?.post(
        url,
        data: data,
    );
  }
}