import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/index.dart';

List<String> rankListData = [
  '解药',
  '鲸落',
  '我们好好的好好的好好的',
  'stay',
  '天上飞',
  '张杰',
  '薛之谦'
];

class RankCard extends StatefulWidget {
  @override
  _RankCardState createState() {
    return _RankCardState();
  }
}

class _RankCardState extends State<RankCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: rw(5), horizontal: rw(5)),
      padding: EdgeInsets.symmetric(horizontal: rw(17), vertical: rw(20)),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color(0xffe5e5e5), blurRadius: 5, spreadRadius: 0)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
          ),
          itemCount: 5,
          itemBuilder: (ctx, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(right: rw(10)),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                          fontSize: sp(16),
                          color: index < 3 ? Colors.red : Colors.black),
                    )),
                Flexible(
                  child: Text(
                    '${rankListData[index]}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: sp(16)),
                    maxLines: 1,
                    softWrap: true,
                  ),
                )
              ],
            );
          }),
    );
  }
}
