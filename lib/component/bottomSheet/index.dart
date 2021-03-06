import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/recommond.dart';
import 'package:flutter_demo/utils/index.dart';

class MyBottomSheet extends StatefulWidget {
  final List<MusicPlayList> musicPlayList;
  MyBottomSheet({Key key, this.musicPlayList});
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String activeTitle;

  @override
  void initState() {
    super.initState();
    setState(() {
      activeTitle = widget.musicPlayList[0].title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            color: Color(0x64e5e5e5),
            padding: EdgeInsets.symmetric(vertical: rw(15), horizontal: rw(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.repeat,
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(rw(10), 0, 0, 0),
                        child: Text(
                          '顺序播放(${widget.musicPlayList.length}首)',
                          style: TextStyle(fontSize: sp(16)),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: rw(5)),
                        child: Icon(
                          Icons.download,
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: rw(5)),
                      child: Icon(
                        Icons.queue,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: rw(5)),
                      child: Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                )
              ],
            )),
        ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: widget.musicPlayList
              .map((renderList) => InkWell(
                  onTap: () {
                    setState(() {
                      activeTitle = renderList.title;
                    });
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      color: renderList.title == activeTitle
                          ? Color(0x64e5e5e5)
                          : Colors.white,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: rw(20),
                          vertical: rw(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              renderList.title,
                              style: TextStyle(fontSize: sp(16)),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(rw(5), 0, rw(5), 0),
                                child: renderList.tag),
                            Text(
                              '-${renderList.musician}',
                              style: TextStyle(
                                  fontSize: sp(14), color: Color(0xffa6a6a6)),
                            )
                          ],
                        ),
                      ))))
              .toList(),
        )
      ],
    );
  }
}
