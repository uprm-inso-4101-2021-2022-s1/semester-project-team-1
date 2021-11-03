import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetHistorySum extends StatelessWidget {
  final String documentId;

  GetHistorySum(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('SumOfCash');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5, left: 10),
                  child: Text(
                    "Revenue:\n" + documentId.toString(),
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30),
                  ),
                ),
                Container(
                    width: 300,
                    height: 200,
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
                        borderRadius:
                            new BorderRadius.all(Radius.circular(20.0))),
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RevenueText("Inventory Revenue:"),
                                    RevenueText(
                                      "${data['SumOfInventory'].toStringAsFixed(2)}",
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RevenueText("Membership Revenue:"),
                                    RevenueText(
                                        "${data['SumOfMemberships'].toStringAsFixed(2)}"),
                                  ],
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RevenueText("Total Revenue:"),
                                    RevenueText(
                                        "${data['SumOfToday'].toStringAsFixed(2)}"),
                                  ],
                                ),
                              ],
                            )))),
                HistoryBackButton()
              ],
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}

class RevenueText extends StatelessWidget {
  RevenueText(
    this.lable,
  );
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Neuton'),
    );
  }
}

class HistoryBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 50),
        child: InkWell(
          child: Container(
                    width: 300,
                    height: 100,
                    decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFF1B1B1B),
                        borderRadius:
                            new BorderRadius.all(Radius.circular(20.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.arrow_back, color: Colors.white,size: 30,),SizedBox(width: 30,),Text("Go Back", style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: 'Neuton'),)],)),
          onTap: () {
            Navigator.pop(context);
          },
        ));
  }
}
