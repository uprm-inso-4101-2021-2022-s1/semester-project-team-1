import 'package:acropolis_member_management/Widgets/SumOfDay/GetSumOfToday.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SumOfTodayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5, left: 10),
          child: Text(
            updatedDateFormat.toString() + "\nToday's Revenue:",
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
        Container(
            width: 300,
            height: 125,
            decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xFF1B1B1B),
                borderRadius: new BorderRadius.all(Radius.circular(20.0))),
            child: Center(child: GetSumOfToday(updatedDateFormat)))
      ],
    );
  }
}
