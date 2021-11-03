import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ScreenSize.dart';

class GymCapacityChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    switch (DateFormat('EEEE').format(DateTime.now())) {
      case "Monday":
        {
          return ChartWidget(
            "5am",
            5,
            "8am",
            10,
            "11am",
            8,
            "1pm",
            5,
            "3pm",
            12,
            "5pm",
            19,
            "7pm",
            15,
            "9pm",
            6,
          );
        }
        break;
      case "Tuesday":
        {
          return ChartWidget(
            "5am",
            6,
            "8am",
            10,
            "11am",
            9,
            "1pm",
            6,
            "3pm",
            11,
            "5pm",
            15,
            "7pm",
            12,
            "9pm",
            6,
          );
        }
        break;
      case "Wednesday":
        {
          return ChartWidget(
            "5am",
            5,
            "8am",
            6,
            "11am",
            8,
            "1pm",
            6,
            "3pm",
            12,
            "5pm",
            14,
            "7pm",
            12,
            "9pm",
            6,
          );
        }
        break;
      case "Thursday":
        {
          return ChartWidget(
            "5am",
            5,
            "8am",
            8,
            "11am",
            8,
            "1pm",
            6,
            "3pm",
            11,
            "5pm",
            13,
            "7pm",
            12,
            "9pm",
            6,
          );
        }
        break;
      case "Friday":
        {
          return ChartWidget(
            "6am",
            5,
            "8am",
            9,
            "10am",
            7,
            "12pm",
            5,
            "1pm",
            10,
            "2pm",
            13,
            "4pm",
            12,
            "6pm",
            6,
          );
        }
        break;
      case "Saturday":
        {
          return ChartWidget(
            "10am",
            6,
            "11am",
            10,
            "12am",
            8,
            "1pm",
            10,
            "2pm",
            9,
            "3pm",
            8,
            "4pm",
            6,
            "",
            0,
          );
        }
        break;
      case "Sunday":
                {
          return ChartWidget(
            "",
            0,
            "3pm",
            5,
            "4am",
            6,
            "5pm",
            8,
            "6pm",
            10,
            "7pm",
            6,
            "",
            0,
            "",
            0,
          );
        }
        break;
      default:
        {
          return SizedBox(
            height: 1,
          );
        }
    }
  }
}

/*ChartWidget(
        "Monday",
        5,
        "Monday",
        5,
        "Monday",
        5,
        "Monday",
        5,
        "Monday",
        5,
        "Monday",
        5,
        "Monday",
        5,
      )*/
class TodaysHoursDash extends StatefulWidget {
  @override
  _TodaysHoursDashState createState() => _TodaysHoursDashState();
}

class _TodaysHoursDashState extends State<TodaysHoursDash> {
  @override
  Widget build(BuildContext context) {
    switch (DateFormat('EEEE').format(DateTime.now())) {
      case "Monday":
        return Text(
          "5:00am - 10:00pm",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
        break;
      case "Tuesday":
        return Text(
          "5:00am - 10:00pm",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
        break;
      case "Wednesday":
        return Text(
          "5:00am - 10:00pm",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
        break;
      case "Thursday":
        return Text(
          "5:00am - 10:00pm",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
        break;
      case "Friday":
        return Text(
          "6:00am - 8:00pm",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
        break;
      case "Saturday":
        return Text(
          "10:00am - 4:00pm",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
        break;
      case "Sunday":
        return Text(
          "3:00pm - 7:00pm",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
        break;
      default:
        return Text(
          "Error: 401",
          style: TextStyle(
              color: Color(0xffFAEEE0), fontFamily: 'Neuton', fontSize: 30),
        );
    }
  }
}

class ChartWidget extends StatefulWidget {
  ChartWidget(
    this.hour1,
    this.int1,
    this.hour2,
    this.int2,
    this.hour3,
    this.int3,
    this.hour4,
    this.int4,
    this.hour5,
    this.int5,
    this.hour6,
    this.int6,
    this.hour7,
    this.int7,
    this.hour8,
    this.int8,
  );
  final String hour1;
  final double int1;
  final String hour2;
  final double int2;
  final String hour3;
  final double int3;
  final String hour4;
  final double int4;
  final String hour5;
  final double int5;
  final String hour6;
  final double int6;
  final String hour7;
  final double int7;
  final String hour8;
  final double int8;

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children:[
      Padding(padding: EdgeInsets.only(bottom: 5),child: Text(
              "Hours Today:  " +
                  DateFormat('EEEE').format(DateTime.now()).toString(),
              style: TextStyle(
                  color: Color(0xffFAEEE0), fontSize: 20, fontFamily: 'Neuton'),
            ),
           ),
    Container(
        width: screenWidth(context) * 0.42,
        height: 200,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Color(0xffFAEEE0))),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            TodaysHoursDash(),
            Divider(color: Color(0xffFAEEE0)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int1 * 5,
                          ),
                          Text(
                            widget.hour1,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int2 * 5,
                          ),
                          Text(
                            widget.hour2,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int3 * 5,
                          ),
                          Text(
                            widget.hour3,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int4 * 5,
                          ),
                          Text(
                            widget.hour4,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int5 * 5,
                          ),
                          Text(
                            widget.hour5,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int6 * 5,
                          ),
                          Text(
                            widget.hour6,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int7 * 5,
                          ),
                          Text(
                            widget.hour7,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 12,
                            height: widget.int8 * 5,
                          ),
                          Text(
                            widget.hour8,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Neuton',
                                color: Color(0xffFAEEE0)),
                          )
                        ],
                      )),
                ]),
            SizedBox(height: 5),
          ]),
        )), Padding(padding: EdgeInsets.only(bottom: 5),child: Text(
              "Popular Times",
              style: TextStyle(
                  color: Color(0xffFAEEE0), fontSize: 20, fontFamily: 'Neuton'),
            ),
           ),]);
  }
}
