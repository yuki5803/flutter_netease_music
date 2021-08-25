import 'package:flutter/widgets.dart';
import 'package:flutter_demo/component/tag/index.dart';

// 渲染单元
class RenderModel {
  String title;
  Widget content;
  EdgeInsetsGeometry padding;
  RenderModel({this.title, this.content, this.padding});
}

class RenderModelInMusician extends RenderModel {
  String tag;
  List<Widget> desc;
  RenderModelInMusician({
    String title,
    Widget content,
    EdgeInsetsGeometry padding,
    this.tag,
    this.desc,
  }) : super(title: title, content: content, padding: padding);
}

class RenderModelInMV {
  String title;
  ImageProvider content;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  RenderModelInMV({this.title, this.content, this.padding, this.margin});
}

class BottomBarRender {
  String title;
  Widget icon;
  Widget activedIcon;
  BottomBarRender({this.title, this.icon, this.activedIcon});
}

class MusicPlayList {
  String title;
  Tag tag;
  String musician;
  MusicPlayList({this.title, this.tag, this.musician});
}
