import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/index.dart';

class DrawMenu extends StatefulWidget {
  final List<DrawMenuItem> children;
  DrawMenu({this.children});

  @override
  _DrawMenuState createState() {
    return _DrawMenuState();
  }
}

class _DrawMenuState extends State<DrawMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: rw(25)),
      padding: EdgeInsets.symmetric(horizontal: rw(20)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: widget.children,
      ),
    );
  }
}

class DrawMenuItem extends StatelessWidget {
  final Icon icon;
  final String title;

  DrawMenuItem({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: rw(1), color: Color(0x64e5e5e5)))),
      padding: EdgeInsets.symmetric(vertical: rw(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              Container(
                  margin: EdgeInsets.only(left: rw(10)),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: sp(14)),
                  )),
            ],
          ),
          Icon(
            Icons.chevron_right,
          ),
        ],
      ),
    );
  }
}
