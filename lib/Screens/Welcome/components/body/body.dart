import 'package:app/Screens/Welcome/components/body/widgets/begin_range.dart';
import 'package:app/Screens/Welcome/components/body/widgets/chu_thich.dart';
import 'package:app/Screens/Welcome/components/body/widgets/end_range.dart';
import 'package:app/Screens/Welcome/components/body/widgets/in_range.dart';
import 'package:app/Screens/Welcome/components/body/widgets/selected_day.dart';
import 'package:app/objects/info.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/Welcome/components/background.dart';

import 'package:app/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Body extends StatefulWidget {
  UserInfo userInfo; //[Minh, 2021-07-01 22:09:12.996523, 1, 15]

  Body({this.userInfo});

  @override
  _BodyState createState() => _BodyState(userInfo);
}

class _BodyState extends State<Body> {
  UserInfo userInfo;
  _BodyState(this.userInfo);

  Map<DateTime, List<Event>> selectedEvents;

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedDay = DateTime.now();
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Phần này thay vì dùng mảng như bạn, mình đã tay thể vào class để dễ hiểu hơn
    var name = userInfo.name; // Tên người dùng
    var periodStart = userInfo.periodStart; // Ngày người dùng khai đã ra máu
    var periodRange =
        userInfo.periodRange; // Khoảng thời gian hành kinh người dùng đã khai
    var cycle = userInfo.cycle; // Chu kì kinh nguyệt mà người dùng khai
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(DateTime.now().year),
                lastDay: DateTime(DateTime.now().year + 1),
                calendarFormat: format,
                // thay dổi format của lịch month -> 2 weeks -> week
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    print("selectday = $selectedDay");
                    print("focus = $focusedDay");
                    format = _format;
                  });
                },
                // ngày bắt đầuc của tuần
                startingDayOfWeek: StartingDayOfWeek.sunday,
                // hiển thị tiêu đề các thứ trong tuần
                daysOfWeekVisible: true,
                // set ngày đặc biệt là ngày 15 mỗi tháng ???? để làm gì nhỉ
                holidayPredicate: (day) {
                  return day.difference(userInfo.periodStart).inDays ==
                      userInfo.cycle;
                },

                //thay đổi ngày - thay đổi ngày chọn và ngày focus
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                    print("selectday = $selectedDay");
                    print("focus = $focusedDay");
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                eventLoader: _getEventsfromDay,

                //To style the calendar
                calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    holidayTextStyle: TextStyle(
                      color: Colors.red,
                    ),
                    rangeHighlightColor: kPrimaryLightColor,
                    rangeEndDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryLightColor,
                    ),
                    rangeStartDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryLightColor,
                    ),
                    rangeEndTextStyle: TextStyle(color: Colors.black),
                    rangeStartTextStyle: TextStyle(color: Colors.black)),

                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                ),

//=========================PHẦN MÌNH ĐÃ LÀM Ở ĐÂY, NHỮNG THỨ BẠN MUỐN CHỈNH SỬA CŨNG Ở ĐÂY==============
//=========================SAU KHI ĐÃ CUSTOM XONG, NHỚ XÓA NHỮNG DÒNG NÀY RỒI MỚI NỘP BÀI===================================================
                calendarBuilders: CalendarBuilders(
                  // Phần này sẽ là phần highlight các ngày mà mình muốn
                  rangeHighlightBuilder: (context, day, isWithinRange) {
                    // tính khoảng thời gian so với ngày hành kinh mà người dùng khai; 0<= period <= chu kì
                    var period = (day.difference(periodStart).inDays) % cycle;
                    if (day
                        .compareTo(periodStart)
                        .isNegative) // những ngày trước khi khai không được liệt kê vào
                      return Container();

                    // ngày đầu tiên ra máu (ngày đầu tiên của chu kì) ~ periodStart
                    if (period == 0)
                      return BeginRangeHighlight(
                        color: Color(0xFF42F578),
                      );

                    // ngày cuối cùng hành kinh
                    if (period == periodRange - 1)
                      return EndRangeHighlight(
                        color: Color(0xFF42F578),
                      );

                    // khoảng thời gian hành khinh
                    if (0 < period && period < periodRange - 1)
                      return InRangeHighlight(
                        color: Color(0xFF42F578),
                        day: day,
                      );

                    // ngày thứ 13 tính từ ngày ra máu đầu tiên (periodStart) -> ngày bắt đầu rụng trứng
                    if (period == 13)
                      return BeginRangeHighlight(
                        color: Color(0xFF258542),
                      );

                    // ngày thứ 17 tính từ ngày ra máu đầu tiên (periodStart)
                    if (period == 17)
                      return EndRangeHighlight(
                        color: Color(0xFF258542),
                      );

                    // khoảng thời gian rụng trứng
                    if (13 < period && period < 17)
                      return InRangeHighlight(
                        color: Color(0xFF258542),
                        day: day,
                      );
                    return Container(); //Trả về container rỗng (size(0,0))
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    // Trả về cahs mình hiển thị khi mà mình chọn một ngày nào đó
                    return Selected(day: day);
                  },
                ),

//============================================================================================
              ),
              ..._getEventsfromDay(selectedDay).map(
                (Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
              ),
              /*FloatingActionButton.extended(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Add Event"),
                        content: TextFormField(
                          controller: _eventController,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel")
                          ),
                          TextButton(
                              child: Text("Ok"),
                              onPressed: () {
                                if (_eventController.text.isEmpty) {

                                } else {
                                  if (selectedEvents[selectedDay] != null) {
                                    selectedEvents[selectedDay].add(
                                      Event(title: _eventController.text),
                                    );
                                  } else {
                                    selectedEvents[selectedDay] = [
                                      Event(title: _eventController.text)
                                    ];
                                  }

                                }
                                Navigator.pop(context);
                                _eventController.clear();
                                setState((){});
                                return;
                              },
                          ),
                        ],
                      )
                  ),
                  label: Text("Add Event"),
                  icon: Icon(Icons.add),
                )*/
              SizedBox(
                height: 15,
              ),
              Note(
                // Hiểu thị lại ghi chú dựa theo tiêu đề, để dùng được Note, colorNote phải được khai báo là Map, xem qua ví dụ
                colorNote: {
                  "First Note": Colors.red,
                  "Second Note": Colors.green,
                  "Third Note": Colors.blue,
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Event {
  final String title;
  Event({@required this.title});

  String toString() => this.title;
}
