import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/utils/index.dart';

class Tag extends StatefulWidget {
  final Color color;
  final String content;
  Tag({this.content, this.color});
  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: rh(1), horizontal: rw(4)),
      margin: EdgeInsets.symmetric(horizontal: rw(2)),
      decoration: BoxDecoration(
          border: Border.all(color: widget.color, width: sp(1)),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        widget.content,
        style: TextStyle(color: widget.color, fontSize: sp(12)),
      ),
    );
  }
}
