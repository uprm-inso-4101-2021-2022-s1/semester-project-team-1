import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/firestore_service.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:acropolis_member_management/Pages/AddMember/AddMemberScreen.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckInsToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getTodaysCheckins()),
    ], child: CheckedInMembers());
  }
}

class CheckedInMembers extends StatelessWidget {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var timeFormatForInventoryLogs = DateFormat("Hm");
    String updatedtimeFormatForInventoryLogs =
        timeFormatForInventoryLogs.format(dateFormat);
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    final memberClass = Provider.of<List<CheckInMemberClass>>(context);

    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 10),
              child: Text(
                "Check-Ins Today: " +
                    memberClass.length.toString() +
                    "\nCheck-In History: " +
                    updatedDateFormat.toString(),
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
                width: screenWidth(context) * 0.35,
                height: screenHeight(context) * 0.9,
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
                child: (memberClass != null)
                    ? Padding(
                        padding: EdgeInsets.all(5),
                        child: ListView.builder(
                            itemCount: memberClass.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  shadowColor: Colors.white30,
                                  child: ListTile(
                                    tileColor: (() {
                                      if (DateTime.parse(
                                              memberClass[index].nextPayDate)
                                          .isBefore(DateTime.now()
                                              .add(Duration(days: -1)))) {
                                        return Colors.red[900];
                                      } else {
                                        return Color(0xFF1B1B1B);
                                      }
                                    }()), //Color(0xFF1B1B1B),
                                    leading: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                          "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                              memberClass[index].memberID +
                                              ".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                                    ),
                                    title: RichText(
                                        text: TextSpan(
                                      text: " " +
                                              memberClass[index].firstName +
                                              " " +
                                              memberClass[index].lastName ??
                                          '',
                                      style: TextStyle(
                                        backgroundColor: Color(0xFF1B1B1B),
                                        fontSize: 15,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "\n" +
                                              " " +
                                              memberClass[index].memberID +
                                              " ",
                                          style: TextStyle(
                                            backgroundColor: Color(0xFF1B1B1B),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )),
                                    subtitle: Text(
                                        //newDateFormat.format(dateFormat)DateFormat("yMMMMd");
                                        "Exp: " +
                                            memberClass[index].nextPayDate +
                                            "\nTime: " +
                                            timeFormatForInventoryLogs
                                                .format(DateTime.parse(
                                                    memberClass[index].time))
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                        textAlign: TextAlign.end),
                                    onLongPress: () async {
                                      await _db
                                          .collection('check-ins')
                                          .doc(memberClass[index].time)
                                          .delete();
                                    },
                                  ));
                            }))
                    : Center(child: CircularProgressIndicator()))
          ],
        ));
  }
}


/*
Single line multiple styles text
RichText(
            text: TextSpan(
              text: ' Single ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              children: [
                TextSpan(
                  text: ' Line ',
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.teal,
                    fontSize: 20,
                  ),
                ),
                TextSpan(
                  text: ' Multiple ',
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'courier',
                    fontSize: 24,
                  ),
                ),
                TextSpan(
                  text: ' Styles ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.pink,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
*/