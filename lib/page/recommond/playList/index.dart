import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/recommond.dart';
import 'package:flutter_demo/page/recommond/commonCard/index.dart';
import 'package:flutter_demo/utils/index.dart';

class PlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final List<RenderModel> songRenderList = [
      RenderModel(
          title: '愿漫长渺小的人生不辜负每份热爱',
          content: Image.asset(
            'Assets/song-1.jpg',
            width: rw(109),
            height: rw(101),
            fit: BoxFit.fitHeight,
          ),
          padding: EdgeInsets.fromLTRB(0, 0, rw(7), 0)),
      RenderModel(
          title: '你好2021',
          content: Image.asset(
            'Assets/song-2.jpg',
            width: rw(109),
            height: rw(101),
            fit: BoxFit.fitHeight,
          ),
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: rw(7))),
      RenderModel(
          title: '他凭什么后来居上',
          content: Image.asset(
            'Assets/song-3.jpg',
            width: rw(109),
            height: rw(101),
            fit: BoxFit.fitHeight,
          ),
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: rw(7))),
      RenderModel(
          title: '还珠双泪垂',
          content: Image.asset(
            'Assets/song-4.jpg',
            width: rw(109),
            height: rw(101),
            fit: BoxFit.fitHeight,
          ),
          padding: EdgeInsets.fromLTRB(rw(7), 0, 0, 0))
      //     padding: EdgeInsets.fromLTRB(rw(7), 0, 0, 0))
    ];
    return CommonCard(
      padding: EdgeInsets.fromLTRB(rw(17), rw(15), rw(17), rw(27)),
      title: '推荐歌单',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: songRenderList
              .map((renderModel) => (Container(
                    margin: renderModel.padding,
                    // padding: ,
                    width: rw(109),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: renderModel.content),
                            Positioned(
                                top: rw(8),
                                right: rw(7),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0x50999999),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_arrow_outlined,
                                          color: Colors.white,
                                          size: sp(18),
                                        ),
                                        Text(
                                          '110万',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: sp(12)),
                                        )
                                      ],
                                    )))
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(top: rw(5)),
                            child: Text(
                              renderModel.title,
                              style: TextStyle(fontSize: sp(12)),
                            ))
                      ],
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
