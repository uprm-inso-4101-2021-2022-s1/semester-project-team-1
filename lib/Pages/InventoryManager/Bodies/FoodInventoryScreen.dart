import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/InventoryWidgets.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../InventoryScreen.dart';

class FoodInventoryScreen extends StatefulWidget {
  @override
  _FoodInventoryScreenState createState() => _FoodInventoryScreenState();
}

class _FoodInventoryScreenState extends State<FoodInventoryScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Inventory')
      .orderBy('listNumber')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        var dateFormat = DateTime.now();
        var newDateFormat = DateFormat("yMMMMd");
        String updatedDateFormat = newDateFormat.format(dateFormat);

        CollectionReference inventory =
            FirebaseFirestore.instance.collection('Inventory');

        CollectionReference inventoryLogger =
            FirebaseFirestore.instance.collection('InventoryLogs');
        CollectionReference sumOfDay =
            FirebaseFirestore.instance.collection('SumOfCash');
        String docID = DateTime.now().toString();
        //ThisGoes into InventoryLogs Collections

        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new Container(
          width: screenWidth(context),
          height: screenHeight(context),
          child: GridView.count(
          childAspectRatio: 1.25,
          padding: EdgeInsets.only(top:20),
          crossAxisCount: 2,
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              Future<void> inventoryFunctionCash() {
                return inventoryLogger
                    .doc(docID)
                    .set({
                      'inventoryName': data['name'],
                      'inventoryCost': data['cost'],
                      'paymentMethod': "Cash",
                      'inventoryDate': updatedDateFormat,
                      'inventoryTime': DateTime.now().toString(),
                      'documentID': docID,
                    })
                    .then((value) => {
                          print("inventoryFunctionCash Successful"),
                          checkInSuccesfulSound(),
                        })
                    .catchError((error) => {
                          print("Failed to add user: $error"),
                          checkInNOTSuccesfulSound()
                        });
              }

              //ThisGoes into InventoryLogs Collections
              Future<void> inventoryFunctionCard() {
                return inventoryLogger
                    .doc(docID)
                    .set({
                      'inventoryName': data['name'],
                      'inventoryCost': data['cost'],
                      'paymentMethod': "Card",
                      'inventoryDate': updatedDateFormat,
                      'inventoryTime': DateTime.now().toString(),
                      'documentID': docID,
                    })
                    .then((value) => {
                          print("inventoryFunctionCard Successful"),
                          checkInSuccesfulSound(),
                        })
                    .catchError((error) => {
                          print("Failed to add user: $error"),
                          checkInNOTSuccesfulSound()
                        });
              }

//ThisGoes into InventoryLogs Collections
              Future<void> inventoryFunctionATH() {
                return inventoryLogger
                    .doc(docID)
                    .set({
                      'inventoryName': data['name'],
                      'inventoryCost': data['cost'],
                      'paymentMethod': "ATH",
                      'inventoryDate': updatedDateFormat,
                      'inventoryTime': DateTime.now().toString(),
                      'documentID': docID,
                    })
                    .then((value) => {
                          print("inventoryFunctionATH Successful"),
                          checkInSuccesfulSound(),
                        })
                    .catchError((error) => {
                          print("Failed to add user: $error"),
                          checkInNOTSuccesfulSound()
                        });
              }
              Future<void> currentTotalReset() {
                return inventory
                    .doc("CurrentTotal")
                    .update({'currentTotal': 0})
                    .then((value) => print("Current Total Updated to 0"))
                    .catchError(
                        (error) => print("Failed to update user: $error"));
              }

              //ThisGoes into InventoryLogs Collections
              Future<void> addToSumOfDay() {
                return sumOfDay
                    .doc(updatedDateFormat)
                    .update({'SumOfToday': FieldValue.increment(data['cost'])})
                    .then((value) => print("User Updated"))
                    .catchError(
                        (error) => print("Failed to update user: $error"))
                    .then((value) => {
                          print("SumOfToday Successful"),
                          //checkInSuccesfulSound(),
                        })
                    .catchError((error) => {
                          print("SumOfToday: $error"),
                          checkInNOTSuccesfulSound()
                        });
              }

              //ThisGoes into InventoryLogs Collections
              Future<void> addToSumOfDayInventory() {
                return sumOfDay
                    .doc(updatedDateFormat)
                    .update(
                        {'SumOfInventory': FieldValue.increment(data['cost'])})
                    .then((value) => print("User Updated"))
                    .catchError(
                        (error) => print("Failed to update user: $error"))
                    .then((value) => {
                          print("SumOfInventory Successful"),
                          //checkInSuccesfulSound(),
                        })
                    .catchError((error) => {
                          print("SumOfInventory: $error"),
                          checkInNOTSuccesfulSound()
                        });
              }

              Future<void> updateUser() {
                return inventory
                    .doc(data['docID'])
                    .update({'inventory': FieldValue.increment(-1)})
                    .then((value) => print("User Updated"))
                    .catchError(
                        (error) => print("Failed to update user: $error"));
              }

                return InventoryItemWidget(
                    data['image'],
                    data['cost'].toString(),
                    data['name'].toString(),
                    data['inventory'].toString(),
                    OutlinedButton(
                        onPressed: () => {
                              updateUser(),
                              inventoryFunctionCash(),
                              addToSumOfDay(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodInventory()))
                            },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.white)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.moneyBillWave,
                              size: 30,
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Cash", style: TextStyle(color: Colors.white)),
                          ],
                        )),
                    OutlinedButton(
                        onPressed: () => {
                              updateUser(),
                              inventoryFunctionATH(),
                              addToSumOfDay(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodInventory()))
                            },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.white)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.mobileAlt,
                              size: 40,
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("ATH Movil",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )),
                    OutlinedButton(
                        onPressed: () => {
                              updateUser(),
                              inventoryFunctionCard(),
                              addToSumOfDay(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodInventory()))
                            },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.white)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.ccVisa,
                              size: 30,
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Card", style: TextStyle(color: Colors.white)),
                          ],
                        )));
            }).toList(),
          ),
        );
      },
    );
  }
}

/*
This widget was used for calculating current total of sale

currentTotal
0
listNumber
"1"
name
"Current Total"



              if (data['name'].toString() == "Current Total") {
                return CurrentTotalItemWidget(
                    data['currentTotal'].toString(),
                    OutlinedButton(
                            onPressed: () => {currentTotalReset()},
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.white)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.redoAlt,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text("Reset",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )));
              } else {
*/