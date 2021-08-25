import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home/index.dart';
import 'package:flutter_demo/page/home/searchPage/index.dart';
import 'package:flutter_demo/page/login/login.dart';
import 'package:flutter_demo/page/test1/index.dart';

class RouteName {
  static const String home = '/home';
  static const String login = '/login';
  static const String test = '/test';
  static const String search = '/search';
}

class TestRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return CupertinoPageRoute(builder: (_) => HomePage());
      case RouteName.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());
      case RouteName.test:
        return CupertinoPageRoute(builder: (_) => Test1());
      case RouteName.search:
        return MaterialPageRoute(builder: (_) => SearchPage());
      default:
        return CupertinoPageRoute(builder: (_) => LoginPage());
    }
  }
}
