import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/CheckIn/CheckInScreen.dart';
import 'package:acropolis_member_management/Pages/CheckIn/SelfKiostScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/CustomIcons.dart';
import 'package:acropolis_member_management/Widgets/CheckIn/CheckInTextHeader.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SearchByMemberIDKiosk extends StatefulWidget {
  @override
  _SearchByMemberIDKioskState createState() => _SearchByMemberIDKioskState();
}

class _SearchByMemberIDKioskState extends State<SearchByMemberIDKiosk> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    CollectionReference checkInUser =
        FirebaseFirestore.instance.collection('check-ins');
    QRViewController controller;

    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

    String docID = DateTime.now().toString();

    Future<void> checkInManually(String firstNameHere, String lastNameHere,
        String memberIdHere, String nextPayDateHere) {
      return checkInUser
          .doc(docID)
          .set({
            'memberID': memberIdHere, //result.code, // John Doe
            'date': updatedDateFormat, // Stokes and Sons
            'time': docID,
            'firstName': firstNameHere,
            'lastName': lastNameHere,
            'nextPayDate': nextPayDateHere
          })
          .then((value) => {
                print("QR Scan Check-In method successful!"),
                if (DateTime.parse(nextPayDateHere)
                    .isBefore(DateTime.now().add(Duration(days: -1))))
                  {checkInNOTSuccesfulSound()}
                else if (DateTime.parse(nextPayDateHere)
                    .isAfter(DateTime.now()))
                  {scanSound()}
              })
          .catchError((error) => {
                print("Failed to add user: $error"),
                // checkInNOTSuccesfulSound()
              });
    }

    return Container(
        width: screenWidth(context),
        height: screenHeight(context),
        child: Scaffold(
            appBar: AppBar(
              leading: Row(
                children: [
                  SizedBox(width: 15),
                  FloatingActionButton(
                    child: Icon(Icons.restore),
                    onPressed: () {
                      controller?.resumeCamera();
                      return Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SelfCheckInScreenKiosk()));
                    },
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              title: Card(
                  child: Container(
                width: screenWidth(context) * 0.5,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Neuton', fontSize: 30),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            const IconData(0xe800, fontFamily: 'TapHereIcon'),
                            size: 50,
                            color: Colors.black,
                          )),
                      suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 10, top: 10),
                          child: Icon(
                            MyCustomIcons.typingIcon,
                            size: 50,
                            color: Colors.black,
                          )),
                      hintText: 'Type Member ID',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Neuton',
                          fontSize: 30)),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
              )),
            ),
            body: (name != "" && name != null && name.length > 3)
                ? StreamBuilder<QuerySnapshot>(
                    stream: (name != "" && name != null)
                        ? FirebaseFirestore.instance
                            .collection('Members')
                            .limit(1)
                            .where("memberID", isGreaterThanOrEqualTo: name)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection("Members")
                            .limit(1)
                            .snapshots(),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot data =
                                    snapshot.data.docs[index];

                                return InkWell(
                                  child: Container(
                                      height: screenHeight(context) * 0.575,
                                      width: screenWidth(context),
                                      decoration: new BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF1B1B1B),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(3,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          gradient: (() {
                                            if (DateTime.parse(
                                                    data['nextPayDate'])
                                                .isBefore(DateTime.now()
                                                    .add(Duration(days: -1)))) {
                                              return LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Colors.red[900],
                                                    Colors.black54,
                                                  ]);
                                            } else if (data['inquiry'] != "" &&
                                                data['inquiry'] != null &&
                                                data['inquiry'] != "empty") {
                                              return LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.blue,
                                                  Colors.black54,
                                                ],
                                              );
                                            } else {
                                              return LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.black26,
                                                  Colors.black54,
                                                ],
                                              );
                                            }
                                          }()),
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(20.0))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 25),
                                                child: CircleAvatar(
                                                  radius: 100,
                                                  backgroundImage: NetworkImage(
                                                      "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                                          data['memberID'] +
                                                          ".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CheckInCardTextHeader(
                                                                  data[
                                                                      'firstName'],
                                                                  "FirstName"),
                                                              CheckInCardTextHeader(
                                                                  data[
                                                                      'lastName'],
                                                                  "LastName"),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              CheckInCardTextHeader(
                                                                  data[
                                                                      'memberID'],
                                                                  "Member ID"),
                                                              SizedBox(
                                                                  width: 25),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      newDateFormat
                                                                              .format(DateTime.parse(data[
                                                                                  'nextPayDate']))
                                                                              .toString() ??
                                                                          "noData",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              30,
                                                                          fontFamily:
                                                                              'Neuton')),
                                                                  Text(
                                                                      "Active Until",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              15,
                                                                          fontFamily:
                                                                              'Neuton')),
                                                                  if (DateTime.parse(data['nextPayDate']).isBefore(DateTime
                                                                              .now()
                                                                          .add(Duration(
                                                                              days:
                                                                                  -1))) ==
                                                                      true)
                                                                    CheckInCardTextHeader(
                                                                        "Membership Expired",
                                                                        "") //newDateFormat.format(DateTime.parse(data['nextPayDate'])).toString() ??"noData",)
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 25),
                                                          child: Container(
                                                              width: 250,
                                                              height: 120,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      gradient: LinearGradient(
                                                                          begin: Alignment
                                                                              .topLeft,
                                                                          end: Alignment
                                                                              .bottomRight,
                                                                          colors: [
                                                                            Colors.blueGrey[700],
                                                                            Colors.black54,
                                                                          ]),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.white),
                                                                      boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black26,
                                                                      spreadRadius:
                                                                          5,
                                                                      blurRadius:
                                                                          7,
                                                                      offset: Offset(
                                                                          3,
                                                                          3), // changes position of shadow
                                                                    ),
                                                                  ]),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    "Check-In ",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Neuton',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            25),
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Icon(
                                                                        const IconData(
                                                                            0xe800,
                                                                            fontFamily:
                                                                                'TapHereIcon'),
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            50,
                                                                      ))
                                                                ],
                                                              )))
                                            ],
                                          ),

                                          //Container with border radius and redius color
                                        ],
                                      )),
                                  onTap: () {
                                    checkInManually(
                                        data['firstName'],
                                        data['lastName'],
                                        data['memberID'],
                                        data['nextPayDate']);
                                    print("tapped here works");
                                    controller?.resumeCamera();

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SelfCheckInScreenKiosk()));

                                    /*
                                                    if (DateTime.parse(
                                                            data['nextPayDate'])
                                                        .isBefore(
                                                            DateTime.now())) {
                                                      return checkInNOTSuccesfulSound()
                                                          .then((value) => Navigator
                                                                  .of(context)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SelfCheckInScreen())));
                                                    } else {
                                                      return checkInSuccesfulSound()
                                                          .then((value) => Navigator
                                                                  .of(context)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SelfCheckInScreen())));
                                                    }*/
                                  },
                                );
                              },
                            );
                    },
                  )
                : Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 225, left: 165),
                          child: Container(
                            height: 125,
                            width: 125,
                          )),
                      Image.asset("assets/AcropolisWhiteLogo.png",
                          width: 400, height: 400),
                      Padding(
                          padding: EdgeInsets.only(top: 225, left: 165),
                          child: Icon(
                            MyCustomIcons.qrScanIcon,
                            color: Colors.white,
                            size: 125,
                          ))
                    ],
                  ))));
  }
}
//QrScanIcon