import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/firestore_service.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Pages/CheckIn/oldCheckInScreen.dart';
import 'package:acropolis_member_management/Widgets/CreateSumOfCashDocs.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InventoryLogsEverythingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getInventoryLogs()),
    ], child: InventoryLogs());
  }
}

class InventoryLogs extends StatelessWidget {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference sumOfDay =
      FirebaseFirestore.instance.collection('SumOfCash');

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var timeFormatForInventoryLogs = DateFormat("Hm");
    String updatedtimeFormatForInventoryLogs = timeFormatForInventoryLogs.format(dateFormat);

    final inventoryClass = Provider.of<List<InventoryInformation>>(context);

    return Padding(
        padding: EdgeInsets.only(top: 20, left: 10, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 10),
              child: Text(
                
                    "\nInventory Log: " +
                    inventoryClass.length.toString() ?? '' +
                    " Items sold",
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
                width: screenWidth(context)*0.34,
                height: screenHeight(context)*0.6,
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
                child: (inventoryClass != null)
                    ? Padding(
                        padding: EdgeInsets.all(5),
                        child: ListView.builder(
                            itemCount: inventoryClass.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  shadowColor: Colors.white30,
                                  child: (inventoryClass[index].paymentMethod ==
                                          "StaffCheckIn")
                                      ? ListTile(
                                          tileColor: Colors.lightBlue[900],
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  inventoryClass[index]
                                                      .inventoryName,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20)),
                                            ],
                                          ),
                                          subtitle: Text(
                                              timeFormatForInventoryLogs
                                                  .format(DateTime.parse(
                                                      inventoryClass[index]
                                                          .inventoryTime))
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                          trailing: getStaffImage(
                                              inventoryClass[index]
                                                  .inventoryName),
                                          onLongPress: () async {
                                            await _db
                                                .collection('InventoryLogs')
                                                .doc(inventoryClass[index].documentID)
                                                .delete();
                                          },
                                        )
                                      : ListTile(
                                          tileColor: Color(0xFF1B1B1B),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  inventoryClass[index]
                                                      .inventoryName,
                                                  style: TextStyle(
                                                      color: inventoryClass[index].paymentMethod == "InventoryLog" ?  Colors.blue[200] :Colors.white,
                                                       
                                                      fontStyle: inventoryClass[index].paymentMethod == "InventoryLog" ?  FontStyle.italic : FontStyle.normal,
                                                      fontSize: 20)),
                                              if (inventoryClass[index]
                                                      .memberID !=
                                                  null)
                                                Text(
                                                    inventoryClass[index]
                                                        .memberID,
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.grey[400],
                                                        fontSize: 15)),
                                            ],
                                          ),
                                          subtitle: Text(
                                              //newDateFormat.format(dateFormat)DateFormat("yMMMMd");
                                              "Time: " +
                                                  timeFormatForInventoryLogs
                                                      .format(DateTime.parse(
                                                          inventoryClass[index].inventoryTime))
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                          trailing: Container(
                                            width: 145,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text( inventoryClass[index].paymentMethod == "InventoryLog" ?  inventoryClass[index].inventoryCost.toString() :"\$ " + inventoryClass[index].inventoryCost.toString(),
                                                    style: TextStyle(fontSize: inventoryClass[index].paymentMethod == "InventoryLog" ?  25 : 20, color: Colors.white, fontStyle: FontStyle.italic )),
                                                
                                                Container(
                                                  width: 50,
                                                  child: getIcon(
                                                      inventoryClass[index]
                                                          .paymentMethod),
                                                )
                                              ],
                                            ),
                                          ),
                                          onLongPress: () async {
                                            if (inventoryClass[index].paymentMethod == "Card" || 
                                            inventoryClass[index].paymentMethod == "Cash" || 
                                            inventoryClass[index].paymentMethod == "ATH" ) {
                                              await _db
                                                  .collection("SumOfCash")
                                                  .doc(updatedDateFormat)
                                                  .update({
                                                    'SumOfToday':
                                                        FieldValue.increment(
                                                            -inventoryClass[
                                                                    index]
                                                                .inventoryCost)
                                                  })
                                                  .then((value) =>
                                                      print("User Updated"))
                                                  .catchError((error) => print(
                                                      "Failed to update user: $error"))
                                                  .then((value) => {
                                                        print(
                                                            "SumOfToday Successful"),
                                                        checkInSuccesfulSound(),
                                                      })
                                                  .catchError((error) => {
                                                        print(
                                                            "SumOfToday: $error"),
                                                        checkInNOTSuccesfulSound()
                                                      });
                                            }
                                            await _db
                                                .collection('InventoryLogs')
                                                .doc(inventoryClass[index]
                                                    .documentID)
                                                .delete()
                                                .then((value) => print(
                                                    "Deleted Log In Inventory Items Logs"));
                                          },
                                        ));
                            }))
                    : Center(child: CircularProgressIndicator()))
          ],
        ));
  }
}

Icon getIcon(String iconName) {
  switch (iconName) {
    case 'Cash':
      {
        return Icon(
          FontAwesomeIcons.moneyBillWave,
          color: Colors.green[400],
          size: 20,
        );
      }
      break;

    case 'Card':
      {
        return Icon(
          FontAwesomeIcons.ccVisa,
          color: Colors.green[400],
          size: 20,
        );
      }
      break;

    case 'ATH':
      {
        return Icon(
          FontAwesomeIcons.mobileAlt,
          color: Colors.green[400],
          size: 30,
        );
      }
      break;
    case 'Register':
      {
        return Icon(
          FontAwesomeIcons.cashRegister,
          size: 30,
          color: Colors.green[400],
        );
      }
      break;
    case 'Remainder':
      {
        return Icon(
          FontAwesomeIcons.envelopeOpenText,
          size: 30,
          color: Colors.red[400],
        );
      }
      break;
    case 'InventoryLog':
      {
        return Icon(
          FontAwesomeIcons.dropbox,
          size: 30,
          color: Colors.blue[400],
        );
      }
      break;
    default:
      {
        return Icon(
          Icons.disabled_by_default_rounded,
          color: Colors.green,
          size: 30,
        );
      }
  }
}

Widget getStaffImage(String staffMemeber) {
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(3, 3), // changes position of shadow
        ),
      ],
      shape: BoxShape.circle,
      image: DecorationImage(
          image: NetworkImage(
              "https://raw.githubusercontent.com/Jankeelol/JBDev.site/master/assets/staff/" +
                  staffMemeber +
                  ".jpg",),
          fit: BoxFit.contain,),
    ),
  );
}


/*

await _db
                                                .collection("SumOfCash")
                                                .doc(updatedDateFormat)
                                                .update({
                                                  'SumOfToday':
                                                      FieldValue.increment(
                                                          -inventoryClass[index]
                                                              .inventoryCost)
                                                })
                                                .then((value) =>
                                                    print("User Updated"))
                                                .catchError((error) => print(
                                                    "Failed to update user: $error"))
                                                .then((value) => {
                                                      print(
                                                          "SumOfToday Successful"),
                                                      checkInSuccesfulSound(),
                                                    })
                                                .catchError((error) => {
                                                      print(
                                                          "SumOfToday: $error"),
                                                      checkInNOTSuccesfulSound()
                                                    });

"https://raw.githubusercontent.com/Jankeelol/JBDev.site/master/assets/staff/" +staffMemeber +".jpg",

Container(
                        margin: EdgeInsets.all(1),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(3, 3), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                      controller.firestoreUser.value.memberID +
                                      ".jpg"),
                              fit: BoxFit.contain),
                        ),
                      ),
tileColor: (() {
                      if (DateTime.parse(memberClass[index].nextPayDate).isBefore(DateTime.now())) {
                        return Colors.red[300];
                      } else if (memberClass[index].inquiry != "" &&
                          memberClass[index].inquiry != null) {
                        return Colors.blue[300];
                      } else {
                        return Colors.grey[350];
                      }
                    }()),

                    */