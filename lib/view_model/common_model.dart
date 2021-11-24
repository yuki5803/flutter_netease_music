import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_demo/api/factory.dart';
import 'package:flutter_demo/config/storage_manage.dart';
import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/provider/view_state_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonModel extends ViewStateModel {
  num userId;
  num roleId;
  String token;
  bool isLogin = false;

  login() async {
    var res = await commonRequest.login('dmt', '123456');
    print(res);
    if (res.success) {
      var loginModel = LoginModel.fromJson(res.data);
      this.userId = loginModel.userId;
      this.roleId = loginModel.roleId;
      this.token = loginModel.token;
      setCertificate();
      BotToast.showText(text: '登录成功!');
    }
    BotToast.showText(text: res.err_msg);
  }

  initLoginStatus() {
    var token = StorageManage.getString(key: 'token');
    var userId = StorageManage.getString(key: 'uid');
    var roleId = StorageManage.getString(key: "rid");
    if (token != null && userId != null && roleId != null) {
      this.isLogin = true;
    }
  }

  setCertificate() {
    StorageManage.setString(key: "token", value: this.token);
    StorageManage.setString(key: "uid", value: this.userId);
    StorageManage.setString(key: "rid", value: this.roleId);
    this.isLogin = true;
    notifyListeners();
  }

  removeCertificate() async {
    await StorageManage.removeString(key: "token");
    await StorageManage.removeString(key: "uid");
    await StorageManage.removeString(key: "rid");
    roleId = null;
    userId = null;
    this.isLogin = false;
    notifyListeners();
  }
}
