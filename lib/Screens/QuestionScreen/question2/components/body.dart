import 'package:app/objects/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/Screens/QuestionScreen/question2/components/background.dart';
import 'package:app/Screens/QuestionScreen/question3/question3.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body(userInfo);

  UserInfo userInfo;
  Body({this.userInfo});
}

class _Body extends State<Body> {
  UserInfo userInfo;
  _Body(this.userInfo);

  String finalDate;

  DateTime date = DateTime.now();

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 1));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  String getDate() {
    if (date == null) {
      return 'Select day';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            height: 50,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "When was your last cycle?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              getDate(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                  color: kPrimaryColor,
                  icon: Icon(Icons.calendar_today),
                  iconSize: 30,
                  onPressed: () {
                    selectTimePicker(context);
                  }),
            )
          ]),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: kPrimaryLightColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    finalDate = date.toString();
                    userInfo.periodStart = date;
                    return Question3(
                      userInfo: userInfo,
                    );
                  }));
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            SizedBox(width: 50),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    finalDate = date.toString();
                    userInfo.periodStart = date;
                    return Question3(
                      userInfo: userInfo,
                    );
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
        ]),
      ),
    );
  }
}
