import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/Welcome/components/body/body.dart';

class WelcomeScreen extends StatelessWidget {
  final UserInfo userInfor;

  WelcomeScreen({this.userInfor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {}),
        ],
        //backgroundColor: Colors.amberAccent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.yellow, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        elevation: 20,
      ),
      body: Body(userInfo: userInfor),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
