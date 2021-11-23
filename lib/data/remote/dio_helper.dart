import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = new Dio(
      BaseOptions(
          //https://api.themoviedb.org/3/
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };

    return  dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required dynamic url,
    Map<String, dynamic>? query,
    required Map<String,dynamic>? data,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };

    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required dynamic url,
    Map<String, dynamic>? query,
    required Map<String,dynamic>? data,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };

    return dio.put(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
