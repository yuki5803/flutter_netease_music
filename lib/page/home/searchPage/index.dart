import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home/searchPage/rankCard/index.dart';
import 'package:flutter_demo/utils/index.dart';

List<Widget> cardList = [RankCard(), RankCard(), RankCard()];

class TabItem {
  final String title;
  final int index;
  TabItem({this.title, this.index});
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  PageController _pageController;
  int currentIndex = 0;
  final List<TabItem> tabList = [
    TabItem(
      title: '热搜榜',
      index: 0,
    ),
    TabItem(
      title: '视频榜',
      index: 1,
    ),
    TabItem(title: '播客榜', index: 2)
  ];

  final List<String> chipRenderList = [
    '拼凑的断音',
    '你的名字',
    '圣诞节',
    '天之弱',
    'uptown funk'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff505050)),
          elevation: 0,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Container(
            padding: EdgeInsets.only(right: rw(25)),
            margin: EdgeInsets.symmetric(vertical: rw(2)),
            child: TextField(
              cursorHeight: rw(22),
              cursorWidth: rw(1),
              cursorColor: Colors.black,
              // autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: rw(1), color: Color(0xffa6a6a6))),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: rw(1), color: Color(0xffa6a6a6))),
                  hintText: '此间少年',
                  hintStyle: TextStyle(color: Color(0xffa6a6a6)),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: rw(7))),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: rw(10)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: rw(17)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: rw(10)),
                            child: Text(
                              '历史',
                              style: TextStyle(
                                  color: Colors.black, fontSize: sp(16)),
                            )),
                        Container(
                          width: rw(250),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: chipRenderList
                                  .map((renderModel) => Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: rw(5)),
                                      child: Chip(
                                          labelPadding: EdgeInsets.symmetric(
                                              horizontal: rw(5)),
                                          backgroundColor: Color(0x99e5e5e5),
                                          label: Text(
                                            renderModel,
                                            style: TextStyle(
                                                fontSize: sp(14),
                                                color: Color(0xff505050)),
                                          ))))
                                  .toList(),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete_outlined,
                              color: Color(0xffa6a6a6),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: rw(10)),
                  child: Row(
                    children: tabList
                        .map((renderModel) => InkWell(
                              onTap: () {
                                _pageController.animateToPage(renderModel.index,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: rw(10)),
                                  child: Text(
                                    renderModel.title,
                                    style: TextStyle(
                                        color: currentIndex == renderModel.index
                                            ? Colors.black
                                            : Color(0x99505050)),
                                  )),
                            ))
                        .toList(),
                  )),
              Container(
                height: rw(200),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => cardList[index],
                  controller: _pageController,
                  itemCount: cardList.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              )
            ],
          ),
        )));
  }
}
