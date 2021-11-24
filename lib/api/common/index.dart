import 'package:dio/dio.dart';
import 'package:flutter_demo/api/base/apiBase.dart';
import 'package:flutter_demo/api/base/request.dart';

class CommonApi extends ApiBase {
  CommonApi(ApiBaseOptions option) {
    this.options = option;
    this.requestInstance = createRequest();
  }

  login(String userName, String passWord) {
    return this
        .post('/login', body: {"password": passWord, "user_name": userName});
  }
}
