import 'package:acropolis_member_management/Pages/FindMember/SearchByCounter.dart';
import 'package:acropolis_member_management/Widgets/CheckIn/CheckInTextHeader.dart';
import 'package:acropolis_member_management/Widgets/CheckIn/PopularTimes.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'oldCheckInScreen.dart';
import 'SelfCheckInsLogs.dart';

class CheckInScreen extends StatefulWidget {
  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {

    String memberIDquery = result != null ? result.code : "";
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    CollectionReference checkInUser =
        FirebaseFirestore.instance.collection('check-ins');
    //Member class checks todays check0ins, i should change the variable name
    String docID = DateTime.now().toString();
    //QR Code Check in method
    Future<void> checkInQR(String firstNameHere, String lastNameHere, String nextPayDateHere) {
  
      if (result != null)
        return checkInUser
            .doc(docID)
            .set({
              'memberID': result.code, // John Doe
              'date': updatedDateFormat, // Stokes and Sons
              'time': docID,
              'firstName':firstNameHere,
              'lastName': lastNameHere,
              'nextPayDate':nextPayDateHere
            })
            .then((value) => {
                  print("QR Scan Check-In method successful!"),
                  //checkInSuccesfulSound(),
                  if (DateTime.parse(nextPayDateHere)
                                    .isBefore(DateTime.now().add(Duration(days: -1)))) {
                                   checkInNOTSuccesfulSound()
                                } else if (DateTime.parse(nextPayDateHere)
                                    .isAfter(DateTime.now())) {
                                  scanSound()
                                }
                })
            .catchError((error) => {
                  print("Failed to add user: $error"),
                  // checkInNOTSuccesfulSound()
                });
      else
        return null; //checkInNOTSuccesfulSound();
    }

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey[800],
          Colors.grey[900],
        ],
      )),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 100, left: 50, right: 50),
                        width: screenWidth(context) * 0.9,
                        height: screenHeight(context) * 0.38,
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
                              color: Colors.black26, //Color(0xFF1B1B1B),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(20.0))),

                          //First assertion must be a != is not Null, else

                          child: Container(
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF1B1B1B),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.black26, //Color(0xFF1B1B1B),
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(20.0))),

                              //First assertion must be a != is not Null, else

                              child: Center(
                                child: Text(
                                  "Member Not Found\n\n\nError Code: 001",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20, fontFamily: 'edo'),
                                ),
                                
                              )),
                              /*Center(
                            child: Text(
                              "Member Not Found" +
                                  "\n\nQR Result: " +
                                  memberIDquery.toString() +
                                  "\n\n\nError Code : 01-A",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),*/
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      width: screenWidth(context) * 0.95,
                      height: screenHeight(context) * 0.67,
                      child: (memberIDquery != "" && memberIDquery != null)
                          ? StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Members')
                                  .where("memberID", isEqualTo: memberIDquery)
                                  .limit(1)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return (snapshot.connectionState ==
                                        ConnectionState.waiting)
                                    ? Center(child: CircularProgressIndicator())
                                    : ListView.builder(
                                        itemCount: snapshot.data.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot data = snapshot.data.docs[index];

                                          if (DateTime.parse(
                                                  data['nextPayDate'])
                                              .isBefore(DateTime.now().add(Duration(days: -1)))) {
                                            //checkInNOTSuccesfulSound();
                                          } else if (DateTime.parse(
                                                  data['nextPayDate'])
                                              .isAfter(DateTime.now())) {
                                            //scanSound();
                                          }

                                          return InkWell(
                                            child: Container(
                                                height: screenHeight(context) *
                                                    0.575,
                                                width: screenWidth(context),
                                                decoration: new BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0xFF1B1B1B),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(3,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    gradient: (() {
                                                      if (DateTime.parse(data[
                                                              'nextPayDate'])
                                                          .isBefore(
                                                              DateTime.now())) {
                                                        return LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              Colors.red[900],
                                                              Colors.black54,
                                                            ]);
                                                      } else if (data['inquiry'] !="" && data['inquiry'] !=null && data['inquiry'] !="empty" ) {
                                                        return LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: [
                                                            Colors.blue,
                                                            Colors.black54,
                                                          ],
                                                        );
                                                      } else {
                                                        return LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: [
                                                            Colors.black26,
                                                            Colors.black54,
                                                          ],
                                                        );
                                                      }
                                                    }()),
                                                    borderRadius:
                                                        new BorderRadius.all(
                                                            Radius.circular(
                                                                20.0))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 25),
                                                          child: CircleAvatar(
                                                            radius: 100,
                                                            backgroundImage: NetworkImage(
                                                                "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                                                    data[
                                                                        'memberID'] +
                                                                    ".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                                                          ),
                                                        ),
                                                        SizedBox(width: 50),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CheckInCardTextHeader(
                                                                    data['firstName'],
                                                                    "FirstName"),
                                                                CheckInCardTextHeader(
                                                                    data[
                                                                        'lastName'],
                                                                    "LastName"),
                                                                SizedBox(width: screenWidth(context) *0.1),
                                                                Image.asset(
                                                                    "assets/AcropolisWhiteLogo.png",
                                                                    width: 175,
                                                                    height:
                                                                        175),
                                                              ],
                                                            ),
                                                            CheckInCardTextHeader(
                                                                data['memberID'],
                                                                "Member ID"),
                                                          ],
                                                        )
                                                      ],
                                                    ),

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
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
                                                                        25,
                                                                    fontFamily:
                                                                        'Neuton')),
                                                            Text("Active Until",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Neuton')),
                                                            if (DateTime.parse(data[
                                                                        'nextPayDate'])
                                                                    .isBefore(
                                                                        DateTime
                                                                            .now()) ==
                                                                true)
                                                              CheckInCardTextHeader(
                                                                  "Membership Expired",
                                                                  "")
                                                          ],
                                                        ),
                                                        SizedBox(width: 150),
                                                        Container(
                                                            width: 250,
                                                            height: 140,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white),
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
                                                                    ],
                                                                    color: Colors
                                                                        .transparent),
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
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                10),
                                                                    child: Icon(
                                                                      const IconData(
                                                                          0xe800,
                                                                          fontFamily:
                                                                              'TapHereIcon'),
                                                                      color: Colors
                                                                          .white,
                                                                      size: 50,
                                                                    ))
                                                              ],
                                                            ))
                                                      ],
                                                    )

                                                    //Container with border radius and redius color
                                                  ],
                                                )),
                                            onTap: () {
                                              checkInQR(data['firstName'], data['lastName'], data['nextPayDate']);

                                              controller?.resumeCamera();

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CheckInScreen()));

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
                                                                          CheckInScreen())));
                                                    } else {
                                                      return checkInSuccesfulSound()
                                                          .then((value) => Navigator
                                                                  .of(context)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          CheckInScreen())));
                                                    }*/
                                            },
                                          );
                                        },
                                      );
                              },
                            )
                          : Container(
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF1B1B1B),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.black26, //Color(0xFF1B1B1B),
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(20.0))),

                              //First assertion must be a != is not Null, else

                              child: Center(
                                child: SearchByMemberIDCounter()
                              )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight(context) * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelfCheckInsTodayLogs(),
                GymCapacityChart(),
                Padding(
                  padding: EdgeInsets.only(right: 25, left: 20),
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(3, 3), // changes position of shadow
                            ),
                          ],
                          color: Color(0xFF1B1B1B),
                          borderRadius:
                              new BorderRadius.all(Radius.circular(20.0))),
                      child: _buildQrView(context)),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 500),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    var scannedDataStream;
    scannedDataStream = controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
        //scannedDataStream.cancel();
        //scanSound();
        // PLAY SOUND HERE
      });
    });
  }
}



/*
Container(
                                              height: 200,
                                              width: 200,
                                              decoration: new BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black26,
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(3,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  color: Colors
                                                      .black26, //Color(0xFF1B1B1B),
                                                  borderRadius: new BorderRadius
                                                          .all(
                                                      Radius.circular(20.0))),

                                              //First assertion must be a != is not Null, else

                                              child: Center(
                                                child: Text(
                                                  "No QR Detected",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              )),
*/

/*
Container(
                  height: 200,
                  width: 200,
                  decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(3, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.black26, //Color(0xFF1B1B1B),
                      borderRadius:
                          new BorderRadius.all(Radius.circular(20.0))),

                  //First assertion must be a != is not Null, else

                  child: Center(
                    child: Text(
                      "No QR Detected",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ))
demo card for testing purposes
Container(
                    height: screenHeight(context) * 0.5,
                    width: screenWidth(context),
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black26,
                            Colors.black54,
                          ],
                        ),
                        borderRadius:
                            new BorderRadius.all(Radius.circular(20.0))),

                    //First assertion must be a != is not Null, else

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25, top: 25),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                    "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/6885.jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                              ),
                            ),
                            Text("FirstName" + "LastName",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),

                        Text("6885"),
                        Text(
                          "\$ 38.97" + "\n" + "September 8 2021",
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          "result.code",
                          style: TextStyle(
                              fontFamily: 'Neuton',
                              color: Colors.white,
                              fontSize: 45),
                        ),
                        //Container with border radius and redius color

                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green[300]),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                "Tap To\nCheck-In",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ))
                      ],
                    ))
*/