import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/Dash/DashScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/InventoryLogsWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class StaffCheckInWidget extends StatefulWidget {
  @override
  _StaffCheckInWidgetState createState() => _StaffCheckInWidgetState();
}

class _StaffCheckInWidgetState extends State<StaffCheckInWidget> {
  var dateFormat = DateTime.now();
  var newDateFormat = DateFormat("yMMMMd");
  CollectionReference inventoryLogger =
      FirebaseFirestore.instance.collection('InventoryLogs');

  String docID = DateTime.now().toString();

  Future<void> staffCheckInFunctionForJean() {
    //ThisGoes into InventoryLogs Collections
    String updatedDateFormat = newDateFormat.format(dateFormat);

    return inventoryLogger
        .doc(docID)
        .set({
          'inventoryName': "Jean",
          //'inventoryCost': "Jean C.",
          'paymentMethod': "StaffCheckIn",
          'inventoryDate': updatedDateFormat,
          'inventoryTime': DateTime.now().toString(),
          'documentID': docID,
        })
        .then((value) => {
              print("Register Check Successful"),
              scanSound(),
            })
        .catchError((error) =>
            {print("Failed to add user: $error"), checkInNOTSuccesfulSound()});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Text(
                        "Staff Check In:",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'iOS',
                            fontSize: 15),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                child: OutlinedButton(
                                  onPressed: () => {
                                    staffCheckInFunctionForJean(),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DashScreen()))
                                  },
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: Colors.blueGrey)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                  child: getStaffImage("Jean"),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("Jean",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    )
                  ],
                )),
            Divider(
              color: Colors.white,
            )
          ],
        )));
  }
}

class StaffCheckInButton extends StatelessWidget {
  StaffCheckInButton(this.staffName, this.staffFuntion);
  final String staffName;
  final Future<void> staffFuntion;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          child: OutlinedButton(
              onPressed: () => {
                    this.staffFuntion,
                    //staffCheckInFunctionForRaul(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashScreen()))
                  },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.blueGrey)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getStaffImage(this.staffName),
                ],
              )),
        ),
        SizedBox(height: 10),
        Text(this.staffName, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
