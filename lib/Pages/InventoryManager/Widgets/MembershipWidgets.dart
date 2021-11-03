import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MembershipManagementWidget extends StatefulWidget {
  MembershipManagementWidget(
    this.cost,
    this.lable, 
    this.controller,
    this.button1,
    this.button2,
    this.button3,
  );

  final String cost;
  final String lable;
  final TextEditingController controller;
  final Widget button1;
  final Widget button2;
  final Widget button3;

  @override
  _MembershipManagementWidgetState createState() => _MembershipManagementWidgetState();
}

class _MembershipManagementWidgetState extends State<MembershipManagementWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Center(
          child: Column(
        children: [
          Container(
            height: 125,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$ " + widget.cost,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'iOS',
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Cost",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'iOS',
                              fontSize: 15),
                        ),
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.lable,
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'iOS', fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 50,
                        width: 200,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: widget.controller,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: "Member ID",
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ))
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: widget.button1,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            child: widget.button2,)
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            child: widget.button3),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          )
        ],
      )));
  }
}
/*
      "\$ " + membershipID.cost.toString(),
      membershipID.name,
      OutlinedButton(
                            onPressed: () => {
                              inventoryFunctionCash(),
                              addToSumOfDay(),
                              addToSumOfDayMemberships(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MembershipInventory()))
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.white)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                            child: Icon(
                              FontAwesomeIcons.moneyBillWave,
                              size: 30,
                              color: Colors.green[300],
                            ),
                          ),
                          OutlinedButton(
                              onPressed: () => {
                                inventoryFunctionATH(),
                                addToSumOfDay(),
                                addToSumOfDayMemberships(),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MembershipInventory()))
                              },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    BorderSide(color: Colors.white)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                              child: Icon(
                                FontAwesomeIcons.mobileAlt,
                                size: 40,
                                color: Colors.green[300],
                              ),
                            )


                            OutlinedButton(
                              onPressed: () => {
                                inventoryFunctionCard(),
                                addToSumOfDay(),
                                addToSumOfDayMemberships(),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MembershipInventory()))
                              },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                    BorderSide(color: Colors.white)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                              child: Icon(
                                FontAwesomeIcons.ccVisa,
                                size: 30,
                                color: Colors.green[300],
                              ),
                            )
                            */