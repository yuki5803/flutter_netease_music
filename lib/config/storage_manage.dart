import 'package:shared_preferences/shared_preferences.dart';

class StorageManage {
  static SharedPreferences sharePerences;

  // 初始化
  static init() async {
    sharePerences = await SharedPreferences.getInstance();
  }

  static setString({key: String, value: dynamic}) async {
    await sharePerences.setString(key, value);
  }

  static getString({key: String}) {
    return sharePerences.getString(key);
  }

  static removeString({key: String}) async {
    await sharePerences.remove(key);
  }
}
