import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/QuestionScreen/question3/components/body.dart';

class Question3 extends StatelessWidget {
  UserInfo userInfo;

  Question3({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userInfo: userInfo),
    );
  }
}
