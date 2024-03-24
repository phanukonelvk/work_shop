import 'package:dio/dio.dart';
import 'package:work_shop/app_connect/app_base_api.dart';

class ApiService {
  ApiService() {
    final options = BaseOptions(
      baseUrl: ApiBaseUrl.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    _dio = Dio(options);
  }

  late Dio _dio;

  Dio get dio => _dio;
}
