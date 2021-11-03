import 'package:flutter/material.dart';

class BillingProfileText extends StatefulWidget {
  BillingProfileText(this.text, this.hintText);

  final String text;
  final String hintText;
  @override
  _BillingProfileTextState createState() => _BillingProfileTextState();
}

class _BillingProfileTextState extends State<BillingProfileText> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top:5, left: 10), child: Column(
      children: [
        Text(
          widget.text,
          style: TextStyle(
              fontSize: 27,
              fontFamily: 'Neuton',
              color: Colors.white,
              decoration: TextDecoration.underline),
        ),
        SizedBox(height: 2),
        Text(
          widget.hintText,
          style: TextStyle(
              fontSize: 15, fontFamily: 'iOSlight', color: Colors.grey),
        )
      ],
    ));
  }
}
