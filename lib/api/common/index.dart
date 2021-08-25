import 'package:flutter_demo/api/base/apiBase.dart';

class CommonApi extends ApiBase {
  CommonApi(ApiBaseOptions option) : super(option);

  login(String userName, String passWord) {
    return this.post('/login', body: {
      {"password": passWord, "username": userName}
    });
  }
}
