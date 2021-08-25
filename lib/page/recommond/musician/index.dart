import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/component/tag/index.dart';
import 'package:flutter_demo/model/recommond.dart';
import 'package:flutter_demo/page/recommond/commonCard/index.dart';
import 'package:flutter_demo/utils/index.dart';

class Musician extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<RenderModelInMusician> renderList = [
      RenderModelInMusician(
          title: '典狱司',
          tag: '-音频怪物',
          desc: [
            Text(
              '超66%人播放',
              style: TextStyle(fontSize: sp(13), color: Color(0xfff8a858)),
            )
          ],
          content: Image.asset(
            "Assets/musician-1.jpg",
            width: rw(64),
            height: rw(61),
            fit: BoxFit.fitHeight,
          )),
      RenderModelInMusician(
          title: '典狱司',
          tag: '-音频怪物',
          desc: [
            Tag(
              color: Colors.red,
              content: 'SQ',
            ),
            Text(
              '愿星辰相伴 天地如梦',
              style: TextStyle(fontSize: sp(13)),
            )
          ],
          content: Image.asset(
            "Assets/musician-2.jpg",
            width: rw(64),
            height: rw(61),
            fit: BoxFit.fitHeight,
          ))
    ];
    return CommonCard(
      margin: EdgeInsets.only(top: rw(10)),
      padding: EdgeInsets.fromLTRB(rw(17), rw(15), rw(17), rw(27)),
      title: '音频怪物 为你推荐',
      titleIcon: Icon(
        Icons.replay_outlined,
        size: sp(18),
      ),
      rightTitle: Container(
          padding: EdgeInsets.symmetric(horizontal: rw(5), vertical: rw(2)),
          decoration: BoxDecoration(
              border: Border.all(width: sp(1), color: Color(0xffa6a6a6)),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                size: rw(18),
                color: Color(0xff383838),
              ),
              Text(
                '播放',
                style: TextStyle(color: Color(0xff505050)),
              )
            ],
          )),
      content: Column(
        children: renderList
            .map((renderModel) => Container(
                margin: EdgeInsets.fromLTRB(0, rh(10), 0, 0),
                child: Row(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: renderModel.content),
                      Align(
                        child: Icon(
                          Icons.play_arrow,
                          color: Color(0xffffffff),
                        ),
                      )
                    ]),
                    Container(
                        margin: EdgeInsets.fromLTRB(rw(10), 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  renderModel.title,
                                  style: TextStyle(
                                      fontSize: sp(16),
                                      color: Color(0xff505050),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  renderModel.tag,
                                  style: TextStyle(
                                      fontSize: sp(13),
                                      color: Color(0xffa6a6a6)),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: renderModel.desc,
                            )
                          ],
                        ))
                  ],
                )))
            .toList(),
      ),
    );
  }
}
