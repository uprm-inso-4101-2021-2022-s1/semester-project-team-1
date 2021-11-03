import 'package:acropolis_member_management/FirebaseBackend/services/MemberClass.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/firestore_service.dart';
import 'package:acropolis_member_management/FirebaseBackend/services/product_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SelfCheckInsTodayLogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      StreamProvider(create: (context) => firestoreService.getTodaysCheckins()),
    ], child: SelfCheckedInMembersLog());
  }
}

class SelfCheckedInMembersLog extends StatelessWidget {
 final FirebaseFirestore _db = FirebaseFirestore.instance;
 
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    final memberClass = Provider.of<List<CheckInMemberClass>>(context);

    return Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5, left: 10),
              child: Text(
                "Check-Ins Today: " +
                      memberClass.length.toString(),
                      //+"\n"+updatedDateFormat.toString(),
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
                width: 270,
                height: 225,
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
                                    tileColor: Color(0xFF1B1B1B),
                                    leading: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                          "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                                              memberClass[index].memberID +
                                              ".jpg"), //memberClass[index].imageURL), // no matter how big it is, it won't overflow
                                    ),
                                    title: Text(
                                      memberClass[index].memberID,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                onLongPress:() async { await _db.collection('check-ins').doc(memberClass[index].time).delete();},

                                  ));
                            }))
                    : Center(child: CircularProgressIndicator()))
          ],
        ));
  }
}
