import 'package:dio/dio.dart';

class ApiConnect {
  static var dio = Dio(
      BaseOptions(baseUrl: "https://ecommerce.codeitappsware.com/api/")
    );
} 