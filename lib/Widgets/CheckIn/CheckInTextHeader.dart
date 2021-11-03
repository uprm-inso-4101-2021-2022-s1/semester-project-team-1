import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckInCardTextHeader extends StatelessWidget {
  CheckInCardTextHeader(this.lable, this.subLable);

  final String lable;
  final String subLable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lable,
              style: TextStyle(
                  color: Colors.white, fontSize: 40, fontFamily: 'Neuton')),
          Text(subLable,
              style: TextStyle(
                  color: Colors.grey, fontSize: 15, fontFamily: 'Neuton'))
        ],
      ),
    );
  }
}