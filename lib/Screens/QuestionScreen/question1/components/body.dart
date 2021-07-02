import 'package:app/objects/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Screens/QuestionScreen/question1/components/background.dart';
import 'package:app/Screens/QuestionScreen/question2/question2.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  List<String> data = [];

  String name = "";

  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = new UserInfo(
      name: "",
      periodStart: DateTime.now(),
      periodRange: 0,
      cycle: 0,
    );
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
                  "What's your name?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 30),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      hintText: "Name or Nickname",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 20,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        userInfo.name = name;
                        return Question2(userInfo: userInfo);
                      }));
                    },
                    child: Text(
                      "Go",
                      style: TextStyle(
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              )
            ]),
      ),
    );
  }
}
