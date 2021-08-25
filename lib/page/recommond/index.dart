import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/recommond.dart';
import 'package:flutter_demo/utils/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'musicVideo/index.dart';
import 'musician/index.dart';
import 'playList/index.dart';

class RecommondPage extends StatefulWidget {
  @override
  State<RecommondPage> createState() => _RecommondPageState();
}

class _RecommondPageState extends State<RecommondPage> {
  final List<RenderModel> menuRenderList = [
    RenderModel(
        title: '每日推荐',
        content: SvgPicture.asset(
          'Assets/icon-1.svg',
          width: rw(28),
          height: rh(28),
        ),
        padding: EdgeInsets.fromLTRB(0, 0, rw(7), 0)),
    RenderModel(
        title: '私人FM',
        content: SvgPicture.asset(
          'Assets/icon-2.svg',
          width: rw(28),
          height: rh(28),
        ),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: rw(7))),
    RenderModel(
        title: '歌单',
        content: SvgPicture.asset(
          'Assets/icon-3.svg',
          width: rw(28),
          height: rh(28),
        ),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: rw(7))),
    RenderModel(
        title: '排行榜',
        content: SvgPicture.asset(
          'Assets/icon-4.svg',
          width: rw(28),
          height: rh(28),
        ),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: rw(7))),
    RenderModel(
        title: '直播',
        content: SvgPicture.asset(
          'Assets/icon-5.svg',
          width: rw(28),
          height: rh(28),
        ),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: rw(7))),
    RenderModel(
        title: '数字专辑',
        content: SvgPicture.asset(
          'Assets/icon-6.svg',
          width: rw(28),
          height: rh(28),
        ),
        padding: EdgeInsets.fromLTRB(rw(7), 0, 0, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0x64e5e5e5),
        width: rw(375),
        child: PageView(children: [
          Container(
              child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                color: Colors.white,
                height: rh(143),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    "Assets/lunbo1.jpg",
                    width: rw(340),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(rw(12), rh(10), rw(12), rh(15)),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: rh(1),
                              style: BorderStyle.solid,
                              color: Color(0xffe5e5e5))),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: menuRenderList
                            .map((renderModel) => Padding(
                                  padding: renderModel.padding,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, rh(7)),
                                        child: ClipOval(
                                          child: Container(
                                              width: rw(51),
                                              height: rw(51),
                                              color: Color(0xfff6d8d8),
                                              alignment: Alignment.center,
                                              child: renderModel.content),
                                        ),
                                      ),
                                      Text(renderModel.title)
                                    ],
                                  ),
                                ))
                            .toList()),
                  )),
              PlayList(),
              Musician(),
              MusicVideo()
            ],
          ))
        ]));
  }
}
