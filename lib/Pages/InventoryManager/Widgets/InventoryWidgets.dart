import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InventoryItemWidget extends StatefulWidget {
  InventoryItemWidget(
    this.image,
    this.cost,
    this.lable,
    this.inventory,
    this.button1,
    this.button2,
    this.button3,
  );

  final String image;
  final String cost;
  final String lable;
  final String inventory;
  final Widget button1;
  final Widget button2;
  final Widget button3;

  @override
  _InventoryItemWidgetState createState() => _InventoryItemWidgetState();
}

class _InventoryItemWidgetState extends State<InventoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
            height: 300,
            width: 375,
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
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            widget.image,
                            width: screenWidth(context) * 0.1,
                            height: screenHeight(context) * 0.1,
                          ),
                          Text(
                            widget.lable,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Neuton',
                                fontSize: 25),
                          ),
                        ],
                      ),
                      Container(width: 150, child: Divider(color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$ " + widget.cost,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Neuton',
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                "Cost",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Neuton',
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.inventory,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Neuton',
                                    fontSize: 35),
                                //Theme.of(context).textTheme.headline4, general themes for fonts.
                              ),
                              Text(
                                "Inventory",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Neuton',
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 100, width: 100, child: widget.button1),
                        ],
                      ),
                      //Next Button, ATM
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 100, width: 100, child: widget.button2),
                        ],
                      ),

                      //Next Button, ATM
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 100, width: 100, child: widget.button3),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
      ],
    ));
  }
}

class CurrentTotalItemWidget extends StatefulWidget {
  CurrentTotalItemWidget(
    this.currentTotal,
    this.button1,
  );

  final String currentTotal;
  final Widget button1;

  @override
  _CurrentTotalItemWidgetState createState() => _CurrentTotalItemWidgetState();
}

class _CurrentTotalItemWidgetState extends State<CurrentTotalItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Center(
            child: Column(
          children: [
            Container(
                height: 75,
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
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Neuton',
                                    fontSize: 25),
                              ),
                              SizedBox(width: 25),
                              Text(
                                "\$ " + widget.currentTotal,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Neuton',
                                  fontSize: 35,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //Cash Button
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 50,
                                  width: 100,
                                  child: widget.button1),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        )));
  }
}
