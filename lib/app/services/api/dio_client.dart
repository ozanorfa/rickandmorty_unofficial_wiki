import 'package:dio/dio.dart';

class DioClient {
  static final Dio instance = _init();

  static Dio _init() {
    final BaseOptions baseOptions = BaseOptions();
    final client = Dio(baseOptions);

    client.interceptors.addAll([]);
    return client;
  }
}
