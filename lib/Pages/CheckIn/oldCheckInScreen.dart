import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';

import 'CheckInsToday.dart';
import 'SelfCheckInsLogs.dart';


class OLDCheckInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OLDCheckInScreenState();
}

class _OLDCheckInScreenState extends State<OLDCheckInScreen> {
  //Organize and categorize variables

  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  var inputvalue1 = TextEditingController();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    final todaysCheckins = Provider.of<List<MemberInformation>>(context);

    String updatedDateFormat = newDateFormat.format(dateFormat);

    CollectionReference checkInUser =
        FirebaseFirestore.instance.collection('check-ins');
    //Member class checks todays check0ins, i should change the variable name
    String docID = DateTime.now().toString();

//QR Code Check in method
    Future<void> checkInQR() {
      if (result != null)
        return checkInUser
            .doc(docID)
            .set({
              'memberID': result.code, // John Doe
              'date': updatedDateFormat, // Stokes and Sons
              'time': docID,
            })
            .then((value) => {
                  print("QR Scan Check-In method successful!"),
                  checkInSuccesfulSound(),
                })
            .catchError((error) => {
                  print("Failed to add user: $error"),
                  checkInNOTSuccesfulSound()
                });
      else
        return null; //checkInNOTSuccesfulSound();
    }

    Future<void> checkInManually() {
      if (inputvalue1.text.isNotEmpty)
        return checkInUser
            .doc(docID)
            .set({
              'memberID': inputvalue1.text, // John Doe
              'date': updatedDateFormat, // Stokes and Sons
              'time': docID,
            })
            .then((value) => {
                  print("Manual Check-In Successful"),
                  checkInSuccesfulSound(),
                })
            .catchError((error) => {
                  print("Failed to add user: $error"),
                  checkInNOTSuccesfulSound()
                });
      else
        return null; //checkInNOTSuccesfulSound();
    }

    return AppScaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 425,
                          width: 425,
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
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(20.0))),
                          child: _buildQrView(context)),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5, left: 10),
                                child: Text(
                                  "Member Image:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
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
                                      color: Colors.black38,
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(20.0))),

                                  //First assertion must be a != is not Null, else
                                  child: Center(
                                    child: (result != null)
                                        ? CircleAvatar(
                                            radius: 75,
                                            backgroundImage: NetworkImage(
                                                "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                                    result.code +
                                                    ".jpg"))
                                        : Text(
                                            "No QR Detected",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                  )),
                            ],
                          ),
                        ),

                        //Temporary CheckInButton
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    child: Text(
                                      "Member ID:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  InkWell(
                                    child: (result != null)
                                        ? Container(
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
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(20.0))),

                                            //First assertion must be a != is not Null, else

                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  result.code,
                                                  style: TextStyle(
                                                      fontFamily: 'Neuton',
                                                      color: Colors.white,
                                                      fontSize: 45),
                                                ),
                                                //Container with border radius and redius color

                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors
                                                              .green[300]),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(3,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 10),
                                                      child: Text(
                                                        "Tap To\nCheck-In",
                                                        style: TextStyle(
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ))
                                              ],
                                            )))
                                        : Container(
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
                                                borderRadius:
                                                    new BorderRadius.all(
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
                                    onTap: () {
                                      checkInQR();
                                      controller?.resumeCamera();
                                    },
                                  ),
                                ])),
                      ],
                    ),
                    //Manual Check-in Implementation
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    child: Text(
                                      "Member Image:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
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
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(20.0))),

                                      //First assertion must be a != is not Null, else

                                      child: Center(
                                        child: (inputvalue1.text.isNotEmpty)
                                            ? CircleAvatar(
                                                radius: 75,
                                                backgroundImage: NetworkImage(
                                                    "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                                        inputvalue1.text +
                                                        ".jpg"))
                                            : Text(
                                                "No ID Detected",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                      )),
                                ])),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 5, left: 10),
                                    child: Text(
                                      "Tap To enter ID:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
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
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(20.0))),

                                      //First assertion must be a != is not Null, else

                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: TextFormField(
                                                  style: TextStyle(
                                                      fontFamily: 'Neuton',
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                  controller: inputvalue1,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                      TextInputFormatter>[
                                                    //redundant but usefult to know statement for maxing the amount of char
                                                    //max input shows the 0/4 design in the bottom
                                                    LengthLimitingTextInputFormatter(
                                                        4),
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r'[0-9]')),
                                                  ],
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(10.0),
                                                    prefixIcon: Icon(
                                                      Icons.person,
                                                      color: Color(0xffece8d9),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                    hintText: 'Enter Member ID',
                                                    hintStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                    filled: true,
                                                  ))),
                                          (inputvalue1.text.isNotEmpty)
                                              ? Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: InkWell(
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .green[300]),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: Offset(3,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                          child: Text(
                                                            "Tap To\nCheck-In",
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20),
                                                          ),
                                                        )),
                                                    onTap: () {
                                                      checkInManually();
                                                    },
                                                  ))
                                              : Text(
                                                  "No ID Detected",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17.5),
                                                ),
                                        ],
                                      )),
                                ])),
                      ],
                    ),
                    SizedBox(height: 450),
                  ],
                )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SelfCheckInsTodayLogs(),
                )
                /*
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
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
                  color: Color(0xFF1B1B1B),
                  borderRadius: new BorderRadius.all(Radius.circular(20.0))),

              //First assertion must be a != is not Null, else

              child: Center(
                child: (result != null)
                    ? Text(
                        result.code,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    : Text(
                        "SCAN 3",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
              )),
        ),*/
              ],
            )));
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
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
        checkInSuccesfulSound();
        // PLAY SOUND HERE
      });
    });
  }

  /* void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
*/
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// Member ID Validator:
// In order for this to work, I have to implement a Form() w/ a button that validates, references are in acropolis_fitness_app

String memberNumber(String value) {
  Pattern pattern = r'^\d{4}$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return "Enter your Member ID";
  else
    return null;
}

void playRemoteFile() {
  AudioPlayer player = new AudioPlayer();
  player.play("https://bit.ly/2CH50TO");
}

Future<AudioPlayer> checkInSuccesfulSound() async {
  AudioCache cache = new AudioCache();
  return await cache.play("successfulCheckIn.mp3", volume: 50.0);
}

Future<AudioPlayer> scanSound() async {
  AudioCache cache = new AudioCache();
  return await cache.play("ScanSound.mp3", volume: 50.0);
}

Future<AudioPlayer> checkInNOTSuccesfulSound() async {
  AudioCache cache = new AudioCache();
  return await cache.play("notSuccessfulCheckIn.mp3", volume: 35.0);
}

//Date time reasources
//https://medium.com/flutter-community/working-with-dates-in-dart-e81c70911811

/*
class OLDCheckInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OLDCheckInScreenState();
}

class _OLDCheckInScreenState extends State<OLDCheckInScreen> {
  @override
  Widget build(BuildContext context) {
    //Catalog All variables after finishing implementation

    Barcode result;
    QRViewController controller;
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    String memberIDresult;
    var inputvalue1 = TextEditingController();

    // In order to get hot reload to work we need to pause the camera if the platform
    // is android, or resume the camera if the platform is iOS.
    @override
    void reassemble() {
      super.reassemble();
      if (Platform.isAndroid) {
        controller.pauseCamera();
      }
      controller.resumeCamera();
    }

    @override
    Widget build(BuildContext context) {
      var dateFormat = DateTime.now();
      var newDateFormat = DateFormat("yMMMMd");
      final todaysCheckins = Provider.of<List<MemberInformation>>(context);

      String updatedDateFormat = newDateFormat.format(dateFormat);

      CollectionReference checkInUser =
          FirebaseFirestore.instance.collection('check-ins');

      Future<void> checkIn() {
        if (result != null)
          return checkInUser
              .add({
                'memberID': result.code, // John Doe
                'date': updatedDateFormat, // Stokes and Sons
                'time': Timestamp.fromDate(DateTime.now()),
              })
              .then((value) => {
                    print("result.code statement 1"),
                    //checkInSuccesfulSound(),
                  })
              .catchError((error) => {
                    print("Failed to add user: $error"),
                    //checkInNOTSuccesfulSound()
                  });
        else if (inputvalue1.text.isNotEmpty)
          return checkInUser
              .add({
                'memberID': inputvalue1.text, // John Doe
                'date': updatedDateFormat, // Stokes and Sons
                'time': Timestamp.fromDate(DateTime.now()),
              })
              .then((value) => {
                    print("Shit 1"),
                    //checkInSuccesfulSound(),
                  })
              .catchError((error) => {
                    print("Failed to add user: $error"),
                    //checkInNOTSuccesfulSound()
                  });
        else
          return null; //checkInNOTSuccesfulSound();
      }

      return AppScaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ));
    }

 
  }   Widget _buildQrView(BuildContext context) {
      // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
      var scanArea = (MediaQuery.of(context).size.width < 400 ||
              MediaQuery.of(context).size.height < 400)
          ? 150.0
          : 300.0;
      // To ensure the Scanner view is properly sizes after rotation
      // we need to listen for Flutter SizeChanged notification and update controller
      return QRView(
        key: qrKey,
        // onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 500),
      );
    }

    void _onQRViewCreated(QRViewController controller) {
      setState(() {
        // this.controller = controller;
      });
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
        });
      });
    }

    @override
    void dispose() {
      controller?.dispose();
      super.dispose();
    }
}

/*
void playRemoteFile() {
  AudioPlayer player = new AudioPlayer();
  player.play("https://bit.ly/2CH50TO");
}

Future<AudioPlayer> checkInSuccesfulSound() async {
  AudioCache cache = new AudioCache();
  return await cache.play("successfulCheckIn.mp3");
}

Future<AudioPlayer> checkInNOTSuccesfulSound() async {
  AudioCache cache = new AudioCache();
  return await cache.play("notSuccessfulCheckIn.mp3");
}
*/
*/

class ManualCheckInWidget extends StatefulWidget {
  @override
  _ManualCheckInWidgetState createState() => _ManualCheckInWidgetState();
}

class _ManualCheckInWidgetState extends State<ManualCheckInWidget> {
  @override
  Widget build(BuildContext context) {
    var inputvalue1 = TextEditingController();
    CollectionReference checkInUser =
        FirebaseFirestore.instance.collection('check-ins');
    String docID = DateTime.now().toString();
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);

    Future<void> checkInManually() {
      if (inputvalue1.text.isNotEmpty)
        return checkInUser
            .doc(docID)
            .set({
              'memberID': inputvalue1.text, // John Doe
              'date': updatedDateFormat, // Stokes and Sons
              'time': docID,
            })
            .then((value) => {
                  print("Manual Check-In Successful"),
                  checkInSuccesfulSound(),
                })
            .catchError((error) => {
                  print("Failed to add user: $error"),
                  checkInNOTSuccesfulSound()
                });
      else
        return null; //checkInNOTSuccesfulSound();
    }

    return Row(
      children: [
        Padding(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: 10),
                child: Text(
                  "Member Image:",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
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
                    child: (inputvalue1.text.isNotEmpty)
                        ? CircleAvatar(
                            radius: 75,
                            backgroundImage: NetworkImage(
                                "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                    inputvalue1.text +
                                    ".jpg"))
                        : Text(
                            "No ID Detected",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                  )),
            ])),
        Padding(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: 10),
                child: Text(
                  "Tap To enter ID:",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
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

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                              style: TextStyle(
                                  fontFamily: 'Neuton',
                                  color: Colors.white,
                                  fontSize: 20),
                              controller: inputvalue1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                //redundant but usefult to know statement for maxing the amount of char
                                //max input shows the 0/4 design in the bottom
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xffece8d9),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(40)),
                                hintText: 'Enter Member ID',
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                                filled: true,
                              ))),
                      (inputvalue1.text.isNotEmpty)
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.green[300]),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(3,
                                              3), // changes position of shadow
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
                                    )),
                                onTap: () {
                                  checkInManually();
                                },
                              ))
                          : Text(
                              "No ID Detected",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.5),
                            ),
                    ],
                  )),
            ])),
      ],
    );
  }
}
