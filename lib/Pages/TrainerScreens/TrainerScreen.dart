import 'package:flutter/material.dart';
import 'package:project_acropolis/Pages/TrainerScreens/nibo/trainerNibo.dart';
import 'package:project_acropolis/UI%20Assets/ScreenSize.dart';
import 'package:project_acropolis/UI%20Assets/backgrounds.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainerPage extends StatefulWidget {
  @override
  _TrainerPageState createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        gradientBackground(context),
        ListView(
          children: <Widget>[
            SizedBox(
              height: screenHeight(context) * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Trainers',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'edo',
                      fontSize: 0.045 * screenHeight(context),
                    ))
              ],
            ),
            //First banner trainer
            SizedBox(
              height: screenHeight(context) * 0.2,
            ),

            Stack(
              children: [
                Center(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: TextButton(
                          onPressed: _jankeeloltwitter,
                          child: Container(
                              width: screenWidth(context) * 0.8,
                              height: screenHeight(context) * 0.2,
                              decoration: new BoxDecoration(
                                image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/trainers/nibo/NiboContainer.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ))),
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}

Route _niboRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TrainerNibo(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 2.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

//nibos page

_launchURL() async {
  const url = 'https://www.instagram.com/niborosa/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url =
      'https://hephaestusnibo.typeform.com/c/fcb1xE10?typeform-cui-avatar=https://images.typeform.com/images/2GucFXj9y3MY';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_jankeeloltwitter() async {
  const url =
      'https://blueprintbynibo.aweb.page/p/8e0b553d-b89b-44da-9f5d-d555789d9687';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
