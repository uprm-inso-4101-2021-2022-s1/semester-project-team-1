import 'package:acropolis_member_management/Pages/Dash/DashScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetSumOfToday extends StatelessWidget {
  final String documentId;

  GetSumOfToday(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('SumOfCash');
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    Future<void> addsumOfTodayFunction() {
      // Call the user's CollectionReference to add a new user
      return users
           .doc(updatedDateFormat.toString())
           .set({
            'SumOfToday': 0
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong\nLikely cause; no internet connection", style: TextStyle(color: Colors.white),);
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: Size(200, 75),
                backgroundColor: Colors.red[300],
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              label: Text(
                "Press This button!\nThanks",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            
              icon: Icon(Icons.check_box, color: Colors.black),
              onPressed: (){
                addsumOfTodayFunction();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashScreen()));
                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Total Revenue Today Created')),
                              );
              });
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height:10),
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RevenueText("Inventory Revenue:"),
                      RevenueText("${data['SumOfInventory'].toStringAsFixed(2)}",),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RevenueText("Membership Revenue:"),
                      RevenueText("${data['SumOfMemberships'].toStringAsFixed(2)}"),
                    ],
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RevenueText("Total Revenue Today:"),
                      RevenueText("${data['SumOfToday'].toStringAsFixed(2)}"),
                    ],
                  ),
                  Divider(color: Colors.white,)
                ],
              ));
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Neuton'),
                      );
  }
}
