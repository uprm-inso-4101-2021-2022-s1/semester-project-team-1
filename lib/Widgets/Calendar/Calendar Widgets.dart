import 'package:flutter/material.dart';

class CalendarButton extends StatefulWidget {
  CalendarButton(
    this.name,
    this.onTap,
  );

  final String name;
  final Widget onTap;

  @override
  _CalendarButtonState createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10),child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey[200],
          ),
          height: 80,
          width: 80,
          child: TextButton(
              child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "Neuton", fontSize: 30, color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => widget.onTap));
              }),
        ),);
  }
}

class CalendarDayLables extends StatefulWidget {
  CalendarDayLables(
    this.name,
  );

  final String name;

  @override
  _CalendarDayLablesState createState() => _CalendarDayLablesState();
}

class _CalendarDayLablesState extends State<CalendarDayLables> {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 45,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "Neuton", fontSize: 18, color: Colors.white),
              ),
            ],
          )
        );
  }
}

class CalendarMonthLables extends StatefulWidget {
  CalendarMonthLables(
    this.name,
  );

  final String name;

  @override
  _CalendarMonthLablesState createState() => _CalendarMonthLablesState();
}

class _CalendarMonthLablesState extends State<CalendarMonthLables> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left:30),
        child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "Neuton", fontSize: 60, color: Colors.white),
              ),);
  }
}

class GreyCalendarButton extends StatefulWidget {
  GreyCalendarButton(
    this.name,
    this.onTap,
  );

  final String name;
  final Widget onTap;

  @override
  _GreyCalendarButtonState createState() => _GreyCalendarButtonState();
}

class _GreyCalendarButtonState extends State<GreyCalendarButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10),child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey[700],
          ),
          height: 80,
          width: 80,
          child: TextButton(
              child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "Neuton", fontSize: 30, color: Colors.black),
              ),
              onPressed: () {}),
        ),);
  }
}