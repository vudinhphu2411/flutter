import 'package:flutter/material.dart';

class BeginRangeHighlight extends StatelessWidget {
  // highlight đầu khoảng thời gian mình xét
  final Color color;
  const BeginRangeHighlight({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
