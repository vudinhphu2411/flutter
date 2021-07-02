import 'package:app/objects/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Screens/QuestionScreen/question4/components/background.dart';
import 'package:app/Screens/Welcome/welcome.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body(userInfo);

  UserInfo userInfo;
  Body({this.userInfo});
}

class _Body extends State<Body> {
  UserInfo userInfo;
  _Body(this.userInfo);

  int length = 15;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "What's your usual cycle length?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 25),
                ),
              ),
              Container(
                height: 100,
                width: size.width * 0.5,
                child: CupertinoPicker(
                  selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                    background: kPrimaryLightColorDarker.withOpacity(0.15),
                  ),
                  children: <Widget>[
                    for (var i = 15; i < 41; i++)
                      Text(
                        i.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kPrimaryColor),
                      )
                  ],
                  itemExtent: 30,
                  onSelectedItemChanged: (value) {
                    length = value + 15;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      userInfo.cycle = length;
                      return WelcomeScreen(userInfor: userInfo);
                    }));
                  },
                  child: Text(
                    "Go",
                    style: TextStyle(
                        color: kPrimaryLightColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ]),
      ),
    );
  }
}
