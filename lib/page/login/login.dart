import 'dart:developer';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/route/router.dart';
import 'package:flutter_demo/utils/index.dart';
import 'package:flutter_demo/view_model/common_model.dart';
import 'package:flutter_demo/view_model/user_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CommonModel>(context);
    var userModel = Provider.of<UserModel>(context);
    if (model.isLogin) {
      Navigator.pop(context);
    }

    return Scaffold(
        body: Container(
      color: Color(0xffec1717),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: rw(150), bottom: rw(230)),
                width: rw(60),
                height: rw(60),
                child: ClipOval(
                  child: Image.asset(
                    "Assets/net_ease_icon.jpeg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "156****3441",
                style: TextStyle(color: Colors.white, fontSize: sp(18)),
              ),
              Icon(
                Icons.border_color_outlined,
                color: Colors.white,
                size: rw(14),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: rw(5)),
              child: Text(
                "中国联通提供认证服务",
                style: TextStyle(
                    fontSize: sp(9), color: Colors.white, letterSpacing: rw(5)),
              )),
          InkWell(
            onTap: () async {
              var res = await model.login();
              print(res);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(top: rw(15)),
              padding:
                  EdgeInsets.symmetric(vertical: rw(10), horizontal: rw(110)),
              child: Text(
                "一键登录",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
