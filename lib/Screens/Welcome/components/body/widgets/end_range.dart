import 'package:flutter/material.dart';

class EndRangeHighlight extends StatelessWidget {
  // highlight cuối khoảng thời gian mình xét
  final Color color;
  const EndRangeHighlight({Key key, this.color}) : super(key: key);

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
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
