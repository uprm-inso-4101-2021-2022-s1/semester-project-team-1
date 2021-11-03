import 'package:acropolis_member_management/Pages/FindMember/MemberProfileScreen.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchByMemberID extends StatefulWidget {
  @override
  _SearchByMemberIDState createState() => _SearchByMemberIDState();
}

class _SearchByMemberIDState extends State<SearchByMemberID> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    return AppScaffold(
        body: Center(
            child: Container(
                width: screenWidth(context),
                height: screenHeight(context),
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back_outlined,
                            color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    title: Card(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.black)),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                      ),
                    ),
                  ),
                  body: StreamBuilder<QuerySnapshot>(
                    stream: (name != "" && name != null)
                        ? FirebaseFirestore.instance
                            .collection('Members')
                            .limit(5)
                            .where("memberID", isGreaterThanOrEqualTo: name)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection("Members")
                            .limit(5)
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
                                return Card(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      tileColor: (() {
                                        if (DateTime.parse(data['nextPayDate']).isBefore(DateTime.now().add(Duration(days: -1)))) {
                                          return Colors.red[300];
                                        } else if (data['inquiry'] != "" && data['inquiry'] != null && data['inquiry'] != "empty") {
                                          return Colors.blue[300];
                                        } else {
                                          return Colors.grey[350];
                                        }
                                      }()),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage("https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" + data['memberID'] + ".jpg")) ?? '', //memberClass[index].imageURL), // no matter how big it is, it won't overflow,
                                      title: Text(data['firstName'] ?? '' +" " + data['lastName']?? '',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    //subtitle: Text(snapshot.data.docs.length.toString() ?? ''),
                                    subtitle: Text(data['memberID'] ?? ''),
                                    trailing: Text(data['payAmount'] +"\n" + newDateFormat.format(DateTime.parse(data['nextPayDate'])).toString() ?? "noData",textAlign: TextAlign.right,),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MemberProfileScreen(data['docID'])));
                                      },
                                    ));
                              },
                            );
                    },
                  ),
                ))));
  }
}
