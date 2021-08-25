import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/index.dart';

class CommonCard extends StatefulWidget {
  final Widget titleIcon;
  final String title;
  final Widget rightTitle;
  final Widget content;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  CommonCard(
      {this.title,
      this.titleIcon,
      this.rightTitle,
      this.content,
      this.margin,
      this.padding});

  @override
  _CommonCardState createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      color: Colors.white,
      child: Column(
        children: [
          // 卡片头部
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.titleIcon ?? Text(''),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: sp(16),
                        color: Color(0xff505050),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              widget.rightTitle
            ],
          ),
          // 卡片内容
          widget.content
        ],
      ),
    );
  }
}
