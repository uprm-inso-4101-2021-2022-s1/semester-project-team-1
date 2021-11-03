import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/Dash/DashScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../InventoryScreen.dart';

class RegisterAndRemainderLog extends StatefulWidget {
  @override
  _RegisterAndRemainderLogState createState() =>
      _RegisterAndRemainderLogState();
}

class _RegisterAndRemainderLogState extends State<RegisterAndRemainderLog> {
  int registerLogAmount = 0;

  var dateFormat = DateTime.now();
  var newDateFormat = DateFormat("yMMMMd");
  CollectionReference inventoryLogger =
      FirebaseFirestore.instance.collection('InventoryLogs');
  CollectionReference sumOfDay =
      FirebaseFirestore.instance.collection('SumOfCash');
  String docID = DateTime.now().toString();

  Future<void> registerLogFunction() {
    //ThisGoes into InventoryLogs Collections
    String updatedDateFormat = newDateFormat.format(dateFormat);

    return inventoryLogger
        .doc(docID)
        .set({
          'inventoryName': "Cash in Register",
          'inventoryCost': registerLogAmount,
          'paymentMethod': "Register",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
          'documentID': docID,
        })
        .then((value) => {
              print("Register Check Successful"),
              checkInSuccesfulSound(),
              registerLogAmount = 0
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  Future<void> remainderLogFunction() {
    //ThisGoes into InventoryLogs Collections
    String updatedDateFormat = newDateFormat.format(dateFormat);

    return inventoryLogger
        .doc(docID)
        .set({
          'inventoryName': "Taken From Register",
          'inventoryCost': registerLogAmount,
          'paymentMethod': "Remainder",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
          'documentID': docID,
        })
        .then((value) => {
              print("Register Check Successful"),
              checkInSuccesfulSound(),
              registerLogAmount = 0
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  void _incrementCounter1() {
    setState(() {
      registerLogAmount++;
    });
  }

  void _incrementCounter10() {
    setState(() {
      registerLogAmount = registerLogAmount + 10;
    });
  }

  void _incrementCounter100() {
    setState(() {
      registerLogAmount = registerLogAmount + 100;
    });
  }

  void _resetNumber() {
    setState(() {
      registerLogAmount = 0;
    });
  }

  void _decrementCounter1() {
    setState(() {
      registerLogAmount--;
    });
  }

  void _decrementCounter10() {
    setState(() {
      registerLogAmount = registerLogAmount - 10;
    });
  }

  void _decrementCounter100() {
    setState(() {
      registerLogAmount = registerLogAmount - 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 40, left: 20),
        child: Center(
            child: Column(
          children: [
            //Text(cash.cashInRegister.toString()),
            Container(
                height: 225,
                width: 750,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\$ " + registerLogAmount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'iOS',
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              child: OutlinedButton(
                                  onPressed: () => {
                                        registerLogFunction(),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DashScreen()))
                                      },
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.green[400])),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.cashRegister,
                                        size: 30,
                                        color: Colors.green[400],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Cash in Register",
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  )),
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 150,
                                  child: OutlinedButton(
                                      onPressed: () => {
                                            remainderLogFunction(),
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DashScreen()))
                                          },
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(color: Colors.red[400])),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.envelopeOpenText,
                                            size: 30,
                                            color: Colors.red[400],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Taken from Register",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 75,
                                  width: 100,
                                  child: OutlinedButton(
                                      onPressed: _incrementCounter1,
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(
                                                color: Colors.green[400])),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                      child: Text(
                                        "+1",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 75,
                                  width: 100,
                                  child: OutlinedButton(
                                      onPressed: _incrementCounter10,
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(
                                                color: Colors.green[400])),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                      child: Text(
                                        "+10",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 75,
                                  width: 100,
                                  child: OutlinedButton(
                                      onPressed: _incrementCounter100,
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(
                                                color: Colors.green[400])),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                      child: Text(
                                        "+100",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 75,
                                  width: 100,
                                  child: OutlinedButton(
                                      onPressed: _decrementCounter1,
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(color: Colors.red[400])),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                      child: Text(
                                        "-1",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 75,
                                  width: 100,
                                  child: OutlinedButton(
                                      onPressed: _decrementCounter10,
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(color: Colors.red[400])),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                      child: Text(
                                        "-10",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  height: 75,
                                  width: 100,
                                  child: OutlinedButton(
                                      onPressed: _decrementCounter100,
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(color: Colors.red[400])),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                      child: Text(
                                        "-100",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
            Divider(
              color: Colors.white,
            )
          ],
        )));
  }
}


/*
Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                              ],
                            ),
                          ],
                        )

                    */