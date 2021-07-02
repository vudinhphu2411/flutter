import 'package:flutter/material.dart';

class InRangeHighlight extends StatelessWidget {
  // Hightlight trong khoảng thời gian mình xét
  final Color color;
  final DateTime day;
  const InRangeHighlight({
    Key key,
    this.color,
    this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(),
      ),
      child: Center(child: Text(day.day.toString())),
    );
  }
}
