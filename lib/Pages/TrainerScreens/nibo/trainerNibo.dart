import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_acropolis/UI%20Assets/ScreenSize.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hybrid.dart';
import 'online.dart';

class TrainerNibo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //niboBackground(context),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  bottom: 0,
                ),
                child: Text(
                  "Nibo",
                  style: TextStyle(
                    fontFamily: 'Edo',
                    color: Colors.white,
                    fontSize: 80,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 0),
                  child: Text(
                    "Rosa",
                    style: TextStyle(
                      fontFamily: 'Edo',
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  )),

              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 15,
                  right: 30,
                ),
                child: Text(
                  "Brindándote claridad y estructura\npara que transformes tu cuerpo. \nTodo en Línea o Híbrido. \nAplica y únete al equipo presionando abajo.",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'iOS'
                      //fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Coaching Programs:",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: InkWell(
                            child: Container(
                              width: 200,
                              height: 125,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(15.0),
                                  topRight: const Radius.circular(15.0),
                                  bottomRight: const Radius.circular(15.0),
                                  bottomLeft: const Radius.circular(15.0),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/Trainers/Nibo/0hybrid.jpg"),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return hybridNibo(context);
                                  },
                                ),
                              );
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: InkWell(
                            child: Container(
                              width: 200,
                              height: 125,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(15.0),
                                  topRight: const Radius.circular(15.0),
                                  bottomRight: const Radius.circular(15.0),
                                  bottomLeft: const Radius.circular(15.0),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/Trainers/Nibo/0online.jpg"),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return onlineNibo(context);
                                  },
                                ),
                              );
                            },
                          )),
                    ],
                  )),

              //social media

              Padding(
                padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          TextButton(
                              //if url autolaunches switch to onPressed: () =>   _launchURL,
                              onPressed: _niboInsta,
                              child: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Colors.white,
                                size: 50,
                              )),
                          Text(
                            "Instagram",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FlatButton(
                              onPressed: _niboCita,
                              child: Icon(Icons.web_asset,
                                  color: Colors.white, size: 50)),
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
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              )
            ]),
        backButton(context)
      ],
    ));
  }
}

_niboInsta() async {
  const url = 'https://www.instagram.com/niborosa/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_niboCita() async {
  const url = 'http://linktr.ee/niborosa';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
