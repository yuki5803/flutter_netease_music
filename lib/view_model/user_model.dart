import 'package:flutter_demo/provider/view_state_model.dart';

class UserModel extends ViewStateModel {
  bool isLogin = false;
  String myCount = '2ppp';

  changeMyCount() {
    myCount = '1pppp';
    notifyListeners();
  }
}
