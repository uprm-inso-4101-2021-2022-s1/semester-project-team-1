import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Helper/MembershipHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../InventoryScreen.dart';
import '../Bodies/FoodInventoryScreen.dart';
import '../Bodies/MembershipInventoryScreen.dart';

class MembershipRegisterAdjust extends StatefulWidget {
  @override
  _MembershipRegisterAdjustState createState() =>
      _MembershipRegisterAdjustState();
}

class _MembershipRegisterAdjustState extends State<MembershipRegisterAdjust> {
  double customMembershipAmount = 0.0;
  var dateFormat = DateTime.now();
  var newDateFormat = DateFormat("yMMMMd");
  CollectionReference inventoryLogger =
      FirebaseFirestore.instance.collection('InventoryLogs');
  CollectionReference sumOfDay =
      FirebaseFirestore.instance.collection('SumOfCash');
  String docID = DateTime.now().toString();

  Future<void> subToSumOfDay() {
    //ThisGoes into InventoryLogs Collections
    return sumOfDay
        .doc(updatedDateFormat)
        .update({'SumOfToday': FieldValue.increment(customMembershipAmount)})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"))
        .then((value) => {
              print("Manual Check-In Successful"),
              checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  Future<void> subToSumOfDayInventory() {
    //ThisGoes into InventoryLogs Collections
    return sumOfDay
        .doc(updatedDateFormat)
        .update(
            {'SumOfMemberships': FieldValue.increment(customMembershipAmount)})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"))
        .then((value) => {
              print("Manual Check-In Successful"),
              //    checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  void _incrementCounter1() {
    setState(() {
      customMembershipAmount++;
    });
  }

  void _incrementCounter10() {
    setState(() {
      customMembershipAmount = customMembershipAmount + 10;
    });
  }

  void _decrementCounter1() {
    setState(() {
      customMembershipAmount--;
    });
  }

  void _decrementCounter10() {
    setState(() {
      customMembershipAmount = customMembershipAmount - 10;
    });

//cents
  }

  void _incrementCounter1c() {
    setState(() {
      customMembershipAmount = customMembershipAmount + 0.01;
    });
  }

  void _incrementCounter10c() {
    setState(() {
      customMembershipAmount = customMembershipAmount + 0.1;
    });
  }

  void _decrementCounter1c() {
    setState(() {
      customMembershipAmount = customMembershipAmount - 0.01;
    });
  }

  void _decrementCounter10c() {
    setState(() {
      customMembershipAmount = customMembershipAmount - 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Center(
            child: Column(
          children: [
            //Text(cash.cashInRegister.toString()),
            Container(
                height: 275,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\$ " + customMembershipAmount.toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'iOS',
                            fontSize: 25,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Revenue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'iOS',
                                  fontSize: 25),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Adjust Membership Revenue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'iOS',
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: OutlinedButton(
                                    onPressed: () => {
                                      subToSumOfDay(),
                                      subToSumOfDayInventory(),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MembershipInventory()))
                                    },
                                    style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                          BorderSide(color: Colors.white)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.moneyBillWave,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("cash",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 75,
                              child: OutlinedButton(
                                  onPressed: _incrementCounter1,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
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
                              height: 50,
                              width: 75,
                              child: OutlinedButton(
                                  onPressed: _incrementCounter10,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
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
                              height: 50,
                              width: 75,
                              child: OutlinedButton(
                                  onPressed: _decrementCounter1,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
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
                              height: 50,
                              width: 75,
                              child: OutlinedButton(
                                  onPressed: _decrementCounter10,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: Text(
                                    "-10",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 100,
                              child: OutlinedButton(
                                  onPressed: _incrementCounter1c,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: Text(
                                    "+0.01",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 100,
                              child: OutlinedButton(
                                  onPressed: _incrementCounter10c,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: Text(
                                    "+0.10",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 100,
                              child: OutlinedButton(
                                  onPressed: _decrementCounter1c,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: Text(
                                    "-0.01",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              width: 100,
                              child: OutlinedButton(
                                  onPressed: _decrementCounter10c,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.white)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: Text(
                                    "-0.10",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )),
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
