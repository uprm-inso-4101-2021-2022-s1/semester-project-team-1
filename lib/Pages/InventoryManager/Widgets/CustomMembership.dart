import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Helper/MembershipHelper.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../InventoryScreen.dart';

class CustomMembershipAmount extends StatefulWidget {
  @override
  _CustomMembershipAmountState createState() => _CustomMembershipAmountState();
}

class _CustomMembershipAmountState extends State<CustomMembershipAmount> {
  //int customMembershipAmount = 0;
  var dateFormat = DateTime.now();
  var newDateFormat = DateFormat("yMMMMd");
  CollectionReference inventoryLogger = FirebaseFirestore.instance.collection('InventoryLogs');
  CollectionReference sumOfDay = FirebaseFirestore.instance.collection('SumOfCash');
  String docID = DateTime.now().toString();
  final memberImputID = TextEditingController();
  final customMembershipAmountLog = TextEditingController();

  Future<void> inventoryFunctionCash() {
    //ThisGoes into InventoryLogs Collections
    String updatedDateFormat = newDateFormat.format(dateFormat);

    return inventoryLogger
        .doc(docID)
        .set({
          'inventoryName': "Custom Membership",
          'inventoryCost': double.parse(customMembershipAmountLog.text),
          'memberID': memberImputID.text,
          'paymentMethod': "Cash",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
          'documentID': docID,
        })
        .then((value) => {
              print("Manual Check-In Successful"),
              //   checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  Future<void> inventoryFunctionATH() {
    String updatedDateFormat = newDateFormat.format(dateFormat);

    //ThisGoes into InventoryLogs Collections
    return inventoryLogger
        .doc(docID)
        .set({
          'inventoryName': "Custom Membership",
          'inventoryCost': double.parse(customMembershipAmountLog.text),
          'memberID': memberImputID.text,
          'paymentMethod': "ATH",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
          'documentID': docID,
        })
        .then((value) => {
              print("Manual Check-In Successful"),
              //   checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  //ThisGoes into InventoryLogs Collections
  Future<void> inventoryFunctionCard() {
    String updatedDateFormat = newDateFormat.format(dateFormat);

    return inventoryLogger
        .doc(docID)
        .set({
          'inventoryName': "Custom Membership",
          'inventoryCost': double.parse(customMembershipAmountLog.text),
          'memberID': memberImputID.text,
          'paymentMethod': "Card",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
          'documentID': docID,
        })
        .then((value) => {
              print("inventoryFunctionCard Successful"),
              //checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  Future<void> addToSumOfDay() {
    //ThisGoes into InventoryLogs Collections
    return sumOfDay
        .doc(updatedDateFormat)
        .update({'SumOfToday': FieldValue.increment(double.parse(customMembershipAmountLog.text))})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"))
        .then((value) => {
              print("Manual Check-In Successful"),
              checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  Future<void> addToSumOfDayMemberships() {
    //ThisGoes into InventoryLogs Collections
    return sumOfDay
        .doc(updatedDateFormat)
        .update({'SumOfMemberships': FieldValue.increment(double.parse(customMembershipAmountLog.text))})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"))
        .then((value) => {
              print("Manual Check-In Successful"),
              //    checkInSuccesfulSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text(cash.cashInRegister.toString()),
            Container(
                height: 225,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Custom Membership",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'iOS',
                                  fontSize: 25),
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 50,
                                width: 200,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: customMembershipAmountLog,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.attach_money,
                                      color: Colors.white,
                                    ),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    labelText: "Cost",
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.black,
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                                  ],
                                )),
                            SizedBox(height: 10),
                            Container(
                                height: 50,
                                width: 200,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: memberImputID,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    labelText: "Member ID",
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.black,
                                  ),
                                ))
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
                                    height: 100,
                                    width: 100,
                                    child: OutlinedButton(
                                        onPressed: () => {
                                              inventoryFunctionCash(),
                                              addToSumOfDay(),
                                              addToSumOfDayMemberships(),
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
                                                      BorderRadius.circular(
                                                          30.0))),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.moneyBillWave,
                                              size: 30,
                                              color: Colors.green[300],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("Cash",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        )))
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: OutlinedButton(
                                        onPressed: () => {
                                              inventoryFunctionATH(),
                                              addToSumOfDay(),
                                              addToSumOfDayMemberships(),
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
                                                      BorderRadius.circular(
                                                          30.0))),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.mobileAlt,
                                              size: 40,
                                              color: Colors.green[300],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("ATH Movil",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        )))
                              ],
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: OutlinedButton(
                                        onPressed: () => {
                                              inventoryFunctionCard(),
                                              addToSumOfDay(),
                                              addToSumOfDayMemberships(),
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
                                                      BorderRadius.circular(
                                                          30.0))),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.ccVisa,
                                              size: 30,
                                              color: Colors.green[300],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("Card",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        )))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
            Divider(
              color: Colors.white,
            ),
                            SizedBox(height: 100),

          ],
        ));
  }
}
