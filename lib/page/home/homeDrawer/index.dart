import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/component/drawMenu/index.dart';
import 'package:flutter_demo/utils/index.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() {
    // TODO: implement createState
    return _HomeDrawerState();
  }
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Color(0x64f3f3f3),
          padding: EdgeInsets.fromLTRB(rw(12), rw(30), rw(12), rw(20)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'Assets/mv-1.jpeg',
                        fit: BoxFit.cover,
                        width: rw(40),
                        height: rw(40),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(rw(13), 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '丶陈小呆',
                            style: TextStyle(fontSize: sp(16)),
                          ),
                          Icon(
                            Icons.chevron_right,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.crop_free,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0x55999999),
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              margin: EdgeInsets.only(top: rw(12)),
              padding:
                  EdgeInsets.symmetric(horizontal: rw(13), vertical: rw(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: rw(10)),
                      padding: EdgeInsets.fromLTRB(rw(10), 0, rw(10), rw(22)),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: rw(1), color: Colors.white))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '开通黑椒VIP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sp(18),
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '立享超17项专属特权',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: sp(11)),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: sp(18),
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: rw(6), vertical: rw(2)),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: rw(1), color: Colors.white),
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              '会员中心',
                              style: TextStyle(
                                  color: Colors.white, fontSize: sp(12)),
                            ),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: rw(10)),
                      child: Text(
                        '限时特惠！黑胶首月仅0.88元！',
                        style: TextStyle(fontSize: sp(11), color: Colors.white),
                        textAlign: TextAlign.start,
                      )),
                ],
              ),
            ),
            DrawMenu(
              children: [
                DrawMenuItem(
                  icon: Icon(
                    Icons.email,
                  ),
                  title: '我的消息',
                ),
                DrawMenuItem(
                  icon: Icon(
                    Icons.palette,
                  ),
                  title: '云贝中心',
                ),
                DrawMenuItem(
                  icon: Icon(
                    Icons.wb_twilight,
                  ),
                  title: '创作者中心',
                )
              ],
            ),
            DrawMenu(
              children: [
                DrawMenuItem(
                  icon: Icon(
                    Icons.store,
                  ),
                  title: '云村有票',
                ),
                DrawMenuItem(
                  icon: Icon(
                    Icons.shopping_bag,
                  ),
                  title: '商城',
                ),
                DrawMenuItem(
                  icon: Icon(
                    Icons.videogame_asset,
                  ),
                  title: '游戏专区',
                ),
                DrawMenuItem(
                  icon: Icon(
                    Icons.add_alert,
                  ),
                  title: '口袋彩铃',
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: rw(20)),
              padding: EdgeInsets.symmetric(vertical: rw(12)),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "退出登录/关闭",
                    style: TextStyle(color: Colors.red, fontSize: sp(16)),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
