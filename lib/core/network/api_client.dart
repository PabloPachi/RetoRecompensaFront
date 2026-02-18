import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'http://localhost:5092',
            headers: {'Content-Type': 'application/json'},
          ),
        );
}
