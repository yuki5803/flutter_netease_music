import 'package:dio/dio.dart';

var apiRoot = 'http://172.16.10.45:8888/api';

createRequest([String root]) {
  BaseOptions options = BaseOptions(
      baseUrl: apiRoot, connectTimeout: 30000, contentType: 'application/json');
  return Dio(options);
}
