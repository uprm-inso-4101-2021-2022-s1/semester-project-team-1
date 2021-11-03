import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitorHistoryScreen extends StatefulWidget {
  @override
  _VisitorHistoryScreenState createState() => _VisitorHistoryScreenState();
}

class _VisitorHistoryScreenState extends State<VisitorHistoryScreen> {

  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;


  @override
  Widget build(BuildContext context) {
        Widget searchData() {
      return Container(
        height: MediaQuery.of(context).size.height - 195,
      width: double.infinity,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1),
            itemCount: snapshotData.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  tileColor: Colors.grey[350],
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://raw.githubusercontent.com/Jankeelol/jankeelol.github.io/main/img/AcropolisFitnessAssets/members/" +
                            snapshotData.docs[index].get('memberID') +
                            ".jpg")),
                title: Text(
                  snapshotData.docs[index].get('memberID'),
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  snapshotData.docs[index].get('time'),
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Text(
                  snapshotData.docs[index].get('date'),
                  style: TextStyle(color: Colors.black),
                ),
              );
            }),
      );
    }
    return AppScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(29.5),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
              isExecuted
                  ? searchData()
                  : Container(
                      child: Text("Search Here"),
                    ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GetBuilder<DataController>(
                    init: DataController(),
                    builder: (val) {
                      return FloatingActionButton(
                          child: Icon(Icons.search),
                          onPressed: () {
                            val.queryData(searchController.text).then((value) {
                              snapshotData = value;
                              setState(() {
                                isExecuted = true;
                              });
                            });
                          });
                    },
                  ),
                  SizedBox(width: 10)
                ],
              ),
              SizedBox(height: 10)
            ],
          )
      ],
    ));
  }
}



class DataController extends GetxController {
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection("check-ins").get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection("check-ins")
        .where("memberID", isEqualTo: queryString)
        .orderBy("time", descending: true)
        .get();
  }
}
