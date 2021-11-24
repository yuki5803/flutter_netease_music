import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/storage_manage.dart';
import 'package:flutter_demo/route/router.dart';
import 'package:flutter_demo/utils/index.dart';
import 'package:flutter_demo/view_model/common_model.dart';
import 'package:provider/provider.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CommonModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: rw(17)),
      child: Column(
        children: [
          Offstage(
            offstage: model.isLogin,
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.login);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: rw(10)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(rw(5), 0, rw(20), 0),
                        child: ClipOval(
                          child: Image.asset(
                            'Assets/unknow_pic.png',
                            fit: BoxFit.cover,
                            width: rw(40),
                            height: rw(40),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "立即登录",
                            style: TextStyle(fontSize: sp(17)),
                          ),
                          Icon(
                            Icons.chevron_right,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Text(model.userId.toString() ?? ""),
          Text(model.roleId.toString() ?? ""),
          Text(StorageManage.sharePerences.getString("rid") ?? ""),
          InkWell(
            onTap: () async {
              await model.removeCertificate();
              BotToast.showText(text: '已清除');
            },
            child: Text('点击清除鉴权'),
          )
        ],
      ),
    );
  }
}
