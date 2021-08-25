import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/recommond.dart';
import 'package:flutter_demo/page/recommond/commonCard/index.dart';
import 'package:flutter_demo/utils/index.dart';

class MusicVideo extends StatelessWidget {
  final List<RenderModelInMV> renderList = [
    RenderModelInMV(
        title: '歌手简介',
        content: AssetImage('Assets/mv-1.jpeg'),
        margin: EdgeInsets.fromLTRB(0, 0, rw(8), 0)),
    RenderModelInMV(
        title: '蓝色生死恋',
        content: AssetImage('Assets/mv-2.jpeg'),
        margin: EdgeInsets.symmetric(horizontal: rw(8))),
    RenderModelInMV(
        title: '核爆现场神曲',
        content: AssetImage('Assets/mv-3.jpg'),
        margin: EdgeInsets.fromLTRB(rw(8), 0, 0, 0))
  ];

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      padding: EdgeInsets.fromLTRB(rw(17), rw(15), rw(17), rw(27)),
      margin: EdgeInsets.only(top: rw(10)),
      title: '精选音乐视频',
      rightTitle: TextButton(
          onPressed: () => print('ppp'),
          child: Row(children: [
            Text('更多'),
            Icon(
              Icons.arrow_forward_ios,
              size: rh(15),
            ),
          ])),
      content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: renderList
                .map((renderModel) => Container(
                    margin: renderModel.margin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, rw(12)),
                              width: rw(163),
                              height: rw(200),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: renderModel.content,
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Positioned(
                                top: rw(7),
                                right: rw(9),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0x50999999),
                                      borderRadius: BorderRadius.circular(16)),
                                  width: rw(65),
                                  height: rw(22),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow_outlined,
                                        color: Colors.white,
                                        size: rw(22),
                                      ),
                                      Text(
                                        '110万',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Text(
                          renderModel.title,
                          style: TextStyle(fontSize: sp(15)),
                        )
                      ],
                    )))
                .toList(),
          )),
    );
  }
}
