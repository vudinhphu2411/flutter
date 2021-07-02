import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/QuestionScreen/question4/components/body.dart';

class Question4 extends StatelessWidget {
  UserInfo userInfo;

  Question4({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(userInfo: userInfo),
    );
  }
}
