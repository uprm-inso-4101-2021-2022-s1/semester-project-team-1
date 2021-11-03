import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Pages/CheckIn/CheckInScreen.dart';
import 'package:acropolis_member_management/Pages/Dash/DashScreen.dart';
import 'package:acropolis_member_management/Pages/InventoryManager/Widgets/CustomIcons.dart';
import 'package:acropolis_member_management/Widgets/CheckIn/CheckInTextHeader.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class SearchByMemberIDCounter extends StatefulWidget {
  @override
  _SearchByMemberIDCounterState createState() => _SearchByMemberIDCounterState();
}

class _SearchByMemberIDCounterState extends State<SearchByMemberIDCounter> {
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

    Future<void> checkInManually(
        String firstNameHere, String lastNameHere, String memberIdHere, String nextPayDateHere) {
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
                                    .isBefore(DateTime.now())) {
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
    }

    return Container(
        width: screenWidth(context),
        height: screenHeight(context),
        child: Scaffold(
            appBar: AppBar(
              leading: Row(children: [ 
                
                SizedBox(width: 15),
                FloatingActionButton(
          child: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            controller?.pauseCamera();
            controller?.stopCamera();
            return Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DashScreen()));
          },
          
        ),
        SizedBox(width: 15),
        FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: () {
            controller?.resumeCamera();
            return Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CheckInScreen()));
          },
          
        ),],),
              backgroundColor: Colors.transparent,
              title: Card(
                child: Container(
                  width: screenWidth(context)*0.5,
                  child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black, fontFamily: 'Neuton', fontSize: 30),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.black,),
                      hintText: 'Type Member ID here',
                      hintStyle: TextStyle(color: Colors.black, fontFamily: 'Neuton', fontSize: 30)),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
                )
              ),
            ),
            body: (name != "" && name != null && name.length >= 3)
                ? StreamBuilder<QuerySnapshot>(
                    stream: (name != "" && name != null)
                        ? FirebaseFirestore.instance
                            .collection('Members')
                            .limit(5)
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
                                                .isBefore(DateTime.now().add(Duration(days: -1)))) {
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
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
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
                                              SizedBox(width: 50),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CheckInCardTextHeader(
                                                          data['firstName'],
                                                          "FirstName"),
                                                      CheckInCardTextHeader(
                                                          data['lastName'],
                                                          "LastName"),
                                                          SizedBox(width: screenWidth(context) *0.1),
                                                      Image.asset(
                                                          "assets/AcropolisWhiteLogo.png",
                                                          width: 175,
                                                          height: 175),
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
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      newDateFormat
                                                              .format(DateTime
                                                                  .parse(data[
                                                                      'nextPayDate']))
                                                              .toString() ??
                                                          "noData",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontFamily:
                                                              'Neuton')),
                                                  Text("Active Until",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'Neuton')),
                                                  if (DateTime.parse(data[
                                                              'nextPayDate'])
                                                          .isBefore(
                                                              DateTime.now()) ==
                                                      true)
                                                    CheckInCardTextHeader(
                                                        "Membership Expired",
                                                        "")
                                                ],
                                              ),
                                              SizedBox(width: 150),
                                              Container(
                                                  width: 250,
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(3,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                      color:
                                                          Colors.transparent),
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
                                                            color: Colors.white,
                                                            fontSize: 25),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Icon(
                                                            const IconData(
                                                                0xe800,
                                                                fontFamily:
                                                                    'TapHereIcon'),
                                                            color: Colors.white,
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
                                    checkInManually(data['firstName'], data['lastName'], data['memberID'], data['nextPayDate']);
                                    print("tapped here works");
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Icon(MyCustomIcons.typingIcon, color: Colors.white, size: 300),
                      Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffFAEEE0),
                                ),
                                color: Color(0xffFAEEE0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: 5,
                            height: 350,
                          ),
                      Icon(MyCustomIcons.qrScanIcon, color: Colors.white, size: 250,)
                    ],))));
  }
}
//QrScanIcon