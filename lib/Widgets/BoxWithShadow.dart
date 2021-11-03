import 'package:flutter/material.dart';

class ShadowBoxBillingPage extends StatefulWidget {
  ShadowBoxBillingPage(this.billingPageDate);
  final String billingPageDate;
  @override
  _ShadowBoxBillingPageState createState() => _ShadowBoxBillingPageState();
}

class _ShadowBoxBillingPageState extends State<ShadowBoxBillingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 40,
                )),
            Container(
                height: 100,
                width: 400,
                decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.black12, //Color(0xFF1B1B1B),
                    borderRadius: new BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Billing List",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xfffbfefb),
                        fontSize: 25,
                        fontFamily: 'Neuton',
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Billing Date: " + widget.billingPageDate,
                      style: TextStyle(
                        color: Color(0xfffbfefb),
                        fontSize: 35,
                        fontFamily: 'Neuton',
                      ),
                    ),
                  ],
                )), 
                SizedBox(width: 40)
          ],
        ));
  }
}
