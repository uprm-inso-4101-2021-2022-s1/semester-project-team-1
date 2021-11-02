import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget onlineNibo(context) {
  return Scaffold(
      body: Stack(children: <Widget>[
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.grey])),
    ),
    Padding(
        padding: EdgeInsets.only(left: 20),
        child: ListView(children: <Widget>[
          SizedBox(height: 30),
          Text("Online",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 40)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Divider(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text("Weekly Video Calls",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text("E-books & Videos to \nmaximize your growth",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text("Access to a \ngrowth-mindset community",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white),
          ),
          (Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text("Nutrition Protocol",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text("Digital food planner",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              Text("Shopping List",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20)),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Colors.white),
          ),
          SizedBox(height: 25),
          (Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: _niboCita,
                  child: Icon(Icons.web_asset, color: Colors.white, size: 75)),
              Text(
                "Schedule",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                "Session",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ))
        ])),
    Padding(
      padding: EdgeInsets.only(top: 50),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        ),
      ),
    ),
  ]));
}

_niboCita() async {
  const url = 'http://linktr.ee/niborosa';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
