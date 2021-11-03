import 'package:flutter/material.dart';

class BillingMemberButton extends StatefulWidget {
  BillingMemberButton(
    this.name,
    this.onTap,
  );

  final String name;
  final Widget onTap;

  @override
  _BillingMemberButtonState createState() => _BillingMemberButtonState();
}

class _BillingMemberButtonState extends State<BillingMemberButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
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
          height: 100,
          width: 100,
          child: TextButton(
              child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "Neuton", fontSize: 35, color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => widget.onTap));
              }),
        ));
  }
}

class NewBillingMemberButton extends StatefulWidget {
  NewBillingMemberButton(
    this.name,
    this.onTap,
  );

  final String name;
  final Widget onTap;

  @override
  _NewBillingMemberButtonState createState() => _NewBillingMemberButtonState();
}

class _NewBillingMemberButtonState extends State<NewBillingMemberButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
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
            color: Colors.grey[400],
          ),
          height: 75,
          width: 200,
          child: TextButton(
              child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "Neuton", fontSize: 25, color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => widget.onTap));
              }),
        ));
  }
}