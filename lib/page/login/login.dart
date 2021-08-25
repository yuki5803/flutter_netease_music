import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/route/router.dart';
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
    var userModel = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),
        body: Form(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 100, 0, 20),
                      child: Text(userModel.myCount),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: '用户名'),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      child: TextField(
                        controller: pwdController,
                        decoration: InputDecoration(labelText: '密码'),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      child: FlatButton(
                        child: Text(
                          '登录',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          print(nameController.text);
                          print(pwdController.text);
                          Navigator.pushNamed(context, RouteName.home);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      child: FlatButton(
                        child: Text(
                          '点击',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          userModel.changeMyCount();
                        },
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
