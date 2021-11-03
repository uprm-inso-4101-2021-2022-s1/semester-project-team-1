import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Create a if today is today then create today and tomorrow. not sure if it will overlap or update?

class CreateIncomeDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 100,
        child: OutlinedButton(
          onPressed: () => {
            docCreate1(),
            docCreate2(),
            docCreate3(),
            docCreate4(),
            docCreate5(),
            docCreate6(),
            docCreate7(),
            docCreate8(),
            docCreate9(),
            docCreate10(),
            docCreate11(),
            docCreate12(),
            docCreate13(),
            docCreate14(),
            docCreate15(),
            docCreate16(),
            docCreate17(),
            docCreate18(),
            docCreate19(),
            docCreate20(),
            docCreate21(),
            docCreate22(),
            docCreate23(),
            docCreate24(),
            docCreate25(),
            docCreate26(),
            docCreate27(),
            docCreate28(),
            docCreate29(),
            docCreate30(),
            docCreate31(),
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.white)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
          ),
          child: Icon(
            Icons.atm,
            size: 40,
            color: Colors.green[400],
          ),
        ));
  }
}

CollectionReference users = FirebaseFirestore.instance.collection('SumOfCash');
var dateFormat = DateTime.now();
String updatedDateFormat = newDateFormat.format(dateFormat);
var newDateFormat = DateFormat("yMMMMd");

String docName1 = "November 1, 2021";
String docName2 = "November 2, 2021";
String docName3 = "November 3, 2021";
String docName4 = "November 4, 2021";
String docName5 = "November 5, 2021";
String docName6 = "November 6, 2021";
String docName7 = "November 7, 2021";
String docName8 = "November 8, 2021";
String docName9 = "November 9, 2021";
String docName10 = "November 10, 2021";
String docName11 = "November 11, 2021";
String docName12 = "November 12, 2021";
String docName13 = "November 13, 2021";
String docName14 = "November 14, 2021";
String docName15 = "November 15, 2021";
String docName16 = "November 16, 2021";
String docName17 = "November 17, 2021";
String docName18 = "November 18, 2021";
String docName19 = "November 19, 2021";
String docName20 = "November 20, 2021";
String docName21 = "November 21, 2021";
String docName22 = "November 22, 2021";
String docName23 = "November 23, 2021";
String docName24 = "November 24, 2021";
String docName25 = "November 25, 2021";
String docName26 = "November 26, 2021";
String docName27 = "November 27, 2021";
String docName28 = "November 28, 2021";
String docName29 = "November 29, 2021";
String docName30 = "November 30, 2021";
String docName31 = "November 31, 2021";

Future<void> docCreate1() {
  return users
      .doc(docName1)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate2() {
  return users
      .doc(docName2)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate3() {
  return users
      .doc(docName3)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate4() {
  return users
      .doc(docName4)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate5() {
  return users
      .doc(docName5)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate6() {
  return users
      .doc(docName6)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate7() {
  return users
      .doc(docName7)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate8() {
  return users
      .doc(docName8)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate9() {
  return users
      .doc(docName9)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate10() {
  return users
      .doc(docName10)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate11() {
  return users
      .doc(docName11)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate12() {
  return users
      .doc(docName12)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate13() {
  return users
      .doc(docName13)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate14() {
  return users
      .doc(docName14)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate15() {
  return users
      .doc(docName15)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate16() {
  return users
      .doc(docName16)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate17() {
  return users
      .doc(docName17)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate18() {
  return users
      .doc(docName18)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate19() {
  return users
      .doc(docName19)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate20() {
  return users
      .doc(docName20)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate21() {
  return users
      .doc(docName21)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate22() {
  return users
      .doc(docName22)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate23() {
  return users
      .doc(docName23)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate24() {
  return users
      .doc(docName24)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate25() {
  return users
      .doc(docName25)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate26() {
  return users
      .doc(docName26)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate27() {
  return users
      .doc(docName27)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate28() {
  return users
      .doc(docName28)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate29() {
  return users
      .doc(docName29)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate30() {
  return users
      .doc(docName30)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> docCreate31() {
  return users
      .doc(docName31)
      .set({'SumOfToday': 0, 'SumOfMemberships': 0, 'SumOfInventory': 0})
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
