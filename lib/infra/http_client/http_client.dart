import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters});
}

class HttpClient extends IHttpClient {
  late Dio _dio;
  HttpClient({required Dio dio, required InterceptorsWrapper interceptors}) {
    _dio = dio;
    _dio.interceptors.add(interceptors);
  }
  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }
}
