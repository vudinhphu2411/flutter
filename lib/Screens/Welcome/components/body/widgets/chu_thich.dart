import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  // widget hiển thị bên dưới lịch những chú thích
  final Map<String, Color> colorNote;
  const Note({
    Key key,
    this.colorNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        colorNote.length,
        (index) => Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: colorNote.values.elementAt(index),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10),
              Text(colorNote.keys.elementAt(index)),
            ],
          ),
        ),
      ),
    );
  }
}
