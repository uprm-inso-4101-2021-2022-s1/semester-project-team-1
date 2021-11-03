import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/InventoryScreen.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InventoryManagerScreen extends StatefulWidget {
  @override
  _InventoryManagerScreenState createState() => _InventoryManagerScreenState();
}

class _InventoryManagerScreenState extends State<InventoryManagerScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Inventory')
      .orderBy('listNumber')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        CollectionReference inventory =
            FirebaseFirestore.instance.collection('Inventory');
                    CollectionReference inventoryLogger = FirebaseFirestore.instance.collection('InventoryLogs');
        String docID = DateTime.now().toString();
        var dateFormat = DateTime.now();
        var newDateFormat = DateFormat("yMMMMd");
        String updatedDateFormat = newDateFormat.format(dateFormat);
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
          child: ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              Future<void> add1() {
                return inventory
                    .doc(data['docID'])
                    .update({'inventory': FieldValue.increment(1)})
                    .then((value) => print("User Updated"))
                    .catchError(
                        (error) => print("Failed to update user: $error"));
              }

              Future<void> add10() {
                return inventory
                    .doc(data['docID'])
                    .update({'inventory': FieldValue.increment(10)})
                    .then((value) => print("User Updated"))
                    .catchError(
                        (error) => print("Failed to update user: $error"));
              }

              Future<void> sub1() {
                return inventory
                    .doc(data['docID'])
                    .update({'inventory': FieldValue.increment(-1)})
                    .then((value) => print("User Updated"))
                    .catchError(
                        (error) => print("Failed to update user: $error"));
              }

              Future<void> sub10() {
                return inventory
                    .doc(data['docID'])
                    .update({'inventory': FieldValue.increment(-10)})
                    .then((value) => print("User Updated"))
                    .catchError(
                        (error) => print("Failed to update user: $error"));
              }

               Future<void> logThisInventory() {
                return inventoryLogger
                    .doc(docID)
                    .set({
                      'inventoryName': data['name'],
                      'inventoryCost': data['inventory'],
                      'paymentMethod': "InventoryLog",
                      'inventoryDate': updatedDateFormat,
                      'inventoryTime': DateTime.now().toString(),
                      'documentID': docID,
                    })
                    .then((value) => {
                          print("inventoryFunctionCash Successful"),
                          scanSound(),
                        })
                    .catchError((error) => {
                          print("Failed to add user: $error"),
                          checkInNOTSuccesfulSound()
                        });
              }

              if (data['name'].toString() == "Current Total") {
                 return SizedBox(height: 1);
               } else {return Padding(
                  //key: ValueKey(foodID.name),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Container(
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      3, 3), // changes position of shadow
                                ),
                              ],
                              color: Color(0xFF1B1B1B),
                              border: Border.all(color: Colors.white24),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(20.0))),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Image.network(
                                  data['image'],
                                  width: screenWidth(context) * 0.13,
                                  height: screenHeight(context) * 0.13
                                ),
                                Text(
                                  data['name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Neuton',
                                      fontSize: 25),
                                ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(height: 40),
                                    Text(
                                      data['inventory'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Neuton',
                                          fontSize: 50),
                                      //Theme.of(context).textTheme.headline4, general themes for fonts.
                                    ),
                                    Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Container(
                                              height: 50,
                                              width: 110,
                                              child: OutlinedButton(
                                                  onPressed: () => {
                                                    logThisInventory(),
                                                    Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        InventoryManager()))
                                                    },
                                                  style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .all(BorderSide(
                                                            color: Colors
                                                                .blue[300])),
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0))),
                                                  ),
                                                  child: Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Neuton',
                                          fontSize: 20),
                                          textAlign: TextAlign.center,
                                    ),),
                                            )),
                                  ],
                                ),
                                Row(
                                  children: [
                                        Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              child: OutlinedButton(
                                                  onPressed: () => {sub10()},
                                                  style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .all(BorderSide(
                                                            color: Colors
                                                                .red[300])),
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0))),
                                                  ),
                                                  child: Text(
                                                    "-10",
                                                    style: TextStyle(
                                                      fontFamily: 'Neuton',
                                                        color: Colors.white,
                                                        fontSize: 30),
                                                  )),
                                            )),
                                            Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              child: OutlinedButton(
                                                  onPressed: () => {sub1()},
                                                  style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .all(BorderSide(
                                                            color: Colors
                                                                .red[300])),
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0))),
                                                  ),
                                                  child: Text(
                                                    "-1",
                                                    style: TextStyle(
                                                      fontFamily: 'Neuton',
                                                        color: Colors.white,
                                                        fontSize: 30),
                                                  )),
                                            )),
                                   Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              child: OutlinedButton(
                                                  onPressed: () => {add1()
                                                        
                                                      },
                                                  style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .all(BorderSide(
                                                            color: Colors
                                                                .green[300])),
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0))),
                                                  ),
                                                  child: Text(
                                                    "+1",
                                                    style: TextStyle(
                                                      fontFamily: 'Neuton',
                                                        color: Colors.white,
                                                        fontSize: 30),
                                                  )),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              child: OutlinedButton(
                                                  onPressed: () => {add10()
                                                      },
                                                  style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .all(BorderSide(
                                                            color: Colors
                                                                .green[300])),
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0))),
                                                  ),
                                                  child: Text(
                                                    "+10",
                                                    style: TextStyle(
                                                      fontFamily: 'Neuton',
                                                        color: Colors.white,
                                                        fontSize: 30),
                                                  )),
                                            )),
                                  ],
                                )
                              ],
                            ),
                          )));}
            }).toList(),
          ),
        );
      },
    );
  }
}

/*

*/