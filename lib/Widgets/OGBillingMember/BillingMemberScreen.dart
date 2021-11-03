/*

import 'package:acropolis_member_management/Widgets/Billing/BillingMemberButton.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'PayDayFilter.dart';

class BillingMemberScreen extends StatelessWidget {
  const BillingMemberScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateTime.now();
    var newDateFormat = DateFormat("yMMMMd");
    String updatedDateFormat = newDateFormat.format(dateFormat);
    return AppScaffold(
        body: SingleChildScrollView(child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 50),
          child: Container(
              height: 150,
              width: 400,
              decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.black12, //Color(0xFF1B1B1B),
                  borderRadius: new BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Billing List\nToday is: " + updatedDateFormat.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xfffbfefb),
                      fontSize: 25,
                      fontFamily: 'Neuton',
                    ),
                  ),
                  SizedBox(height: 15),
                  
                ],
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingMemberButton("1", BillingDate01()),
            BillingMemberButton("2", BillingDate02()),
            BillingMemberButton("3", BillingDate03()),
            BillingMemberButton("4", BillingDate04()),
            BillingMemberButton("5", BillingDate05()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingMemberButton("6", BillingDate06()),
            BillingMemberButton("7", BillingDate07()),
            BillingMemberButton("8", BillingDate08()),
            BillingMemberButton("9", BillingDate09()),
            BillingMemberButton("10", BillingDate10()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingMemberButton("11", BillingDate11()),
            BillingMemberButton("12", BillingDate12()),
            BillingMemberButton("13", BillingDate13()),
            BillingMemberButton("14", BillingDate14()),
            BillingMemberButton("15", BillingDate15()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingMemberButton("16", BillingDate16()),
            BillingMemberButton("17", BillingDate17()),
            BillingMemberButton("18", BillingDate18()),
            BillingMemberButton("19", BillingDate19()),
            BillingMemberButton("20", BillingDate20()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingMemberButton("21", BillingDate21()),
            BillingMemberButton("22", BillingDate22()),
            BillingMemberButton("23", BillingDate23()),
            BillingMemberButton("24", BillingDate24()),
            BillingMemberButton("25", BillingDate25()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BillingMemberButton("26", BillingDate26()),
            BillingMemberButton("27", BillingDate27()),
            BillingMemberButton("28", BillingDate28()),
            BillingMemberButton("29", BillingDate29()),
            BillingMemberButton("30", BillingDate30()),
          ],
        ),
        SizedBox(height:40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewBillingMemberButton("New Members", NewMembers()),
          ],
        ),
        SizedBox(height:40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewBillingMemberButton("Monthly", BillingDateMonthly()),
            NewBillingMemberButton("Special", BillingDateSpecial()),
          ],
        ),
        SizedBox(height:40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NewBillingMemberButton("Paid Year", BillingDateYear()),
            NewBillingMemberButton("All Members", BillingDateALL()),
          ],
        ),
      ],
    )));
  }
}
*/