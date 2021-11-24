import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/api/base/responses.dart';

class ApiBaseOptions {
  int _userID;
  String _token;

  setCredential(String token, int userID) {
    this._userID = userID;
    this._token = token;
  }
}

typedef ErrorHandle = Function(dynamic data, int status);
typedef RequestType = Future<Response> Function();
Future<BaseResponses> warpperSend(RequestType request,
    [ErrorHandle errorHandle]) async {
  try {
    var res = await request();
    return BaseResponses.fromJson(res.data);
  } on DioError catch (e) {
    print(e.response);
    if (e.response.statusCode == 403) {
      BotToast.showText(text: '登录超时', duration: Duration(seconds: 3));
      return BaseResponses.fromJson(
          {'err_code': '请求异常', 'success': false, 'data': null});
    } else {
      BotToast.showText(text: '请求超时', duration: Duration(seconds: 3));
      return BaseResponses.fromJson(
          {'err_code': '请求超时', 'success': false, 'data': null});
    }
  }
}

class ApiBase {
  Dio requestInstance;
  ApiBaseOptions options;

  Future<BaseResponses> post(String url, {dynamic body}) async {
    var res = await warpperSend(() {
      return this.requestInstance.post(url, data: body);
    });
    return res;
  }
}
