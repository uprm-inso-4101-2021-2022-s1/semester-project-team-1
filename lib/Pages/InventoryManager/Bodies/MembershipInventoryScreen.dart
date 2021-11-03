import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/MembershipWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../InventoryScreen.dart';
import '../Widgets/CustomMembership.dart';

class MembershipInventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MembershipManagementListScreen(),
        CustomMembershipAmount(),
        
        //MembershipRegisterAdjust()
      ],
    );
  }
}

class MembershipManagementListScreen extends StatefulWidget {
  @override
  _MembershipManagementListScreenState createState() =>
      _MembershipManagementListScreenState();
}

class _MembershipManagementListScreenState
    extends State<MembershipManagementListScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Memberships')
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

        final memberImputID = new TextEditingController();

        CollectionReference inventoryLogger = FirebaseFirestore.instance.collection('InventoryLogs');
        CollectionReference sumOfDay = FirebaseFirestore.instance.collection('SumOfCash');
        String docID = DateTime.now().toString();
        //ThisGoes into InventoryLogs Collections

        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Padding(padding: EdgeInsets.only(top: 25),child: Column(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            Future<void> inventoryFunctionCash() {
              //ThisGoes into InventoryLogs Collections
              return inventoryLogger
                  .doc(docID)
                  .set({
                    'inventoryName': data['name'],
                    'inventoryCost': data['cost'],
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
                  .catchError((error) => {
                        print("Failed to add user: $error"),
                        checkInNOTSuccesfulSound()
                      });
            }

            Future<void> inventoryFunctionATH() {
              //ThisGoes into InventoryLogs Collections
              return inventoryLogger
                  .doc(docID)
                  .set({
                    'inventoryName': data['name'],
                    'inventoryCost': data['cost'],
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
                  .catchError((error) => {
                        print("Failed to add user: $error"),
                        checkInNOTSuccesfulSound()
                      });
            }

            //ThisGoes into InventoryLogs Collections
            Future<void> addToSumOfDay() {
              return sumOfDay
                  .doc(updatedDateFormat)
                  .update({'SumOfToday': FieldValue.increment(data['cost'])})
                  .then((value) => print("User Updated"))
                  .catchError((error) => print("Failed to update user: $error"))
                  .then((value) => {
                        print("SumOfToday Successful"),
                        checkInSuccesfulSound(),
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
                  .catchError((error) => print("Failed to update user: $error"))
                  .then((value) => {
                        print("SumOfInventory Successful"),
                        //checkInSuccesfulSound(),
                      })
                  .catchError((error) => {
                        print("SumOfInventory: $error"),
                        checkInNOTSuccesfulSound()
                      });
            }

            return MembershipManagementWidget(
                data['cost'].toString(),
                data['name'],
                memberImputID,
                OutlinedButton(
                    onPressed: () => {
                          inventoryFunctionCash(),
                          addToSumOfDay(),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MembershipInventory()))
                        },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.white)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                          inventoryFunctionATH(),
                          addToSumOfDay(),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MembershipInventory()))
                        },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.white)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                          inventoryFunctionCard(),
                          addToSumOfDay(),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MembershipInventory()))
                        },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.white)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
        ));
      },
    );
  }
}
