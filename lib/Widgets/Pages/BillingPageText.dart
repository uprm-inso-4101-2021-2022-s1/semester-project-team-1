import 'package:flutter/material.dart';

class BillingPageText extends StatefulWidget {
  BillingPageText(this.textTitle);
  final String textTitle;
  @override
  _BillingPageTextState createState() => _BillingPageTextState();
}

class _BillingPageTextState extends State<BillingPageText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Center(
          child: Text(
            widget.textTitle,
            style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Neuton'),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
