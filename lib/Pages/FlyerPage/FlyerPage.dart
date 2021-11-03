import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FlyerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Container(
      color: Colors.black38,
      width: screenWidth(context),
      height: screenHeight(context),
      child: ListView(
        children: [
          SizedBox(height: 35),
          FlyerTextTitle("We take building bodies seriously"),
          SizedBox(height: 25),
          FlyerTextTitle("se parte del team acropolis"),
          SizedBox(height: 25),
          FlyerTextTitle("¡ Matricúlate ya!"),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlyerText("1 Mes\nSinContrato"),
                  SizedBox(height: 50),
                  FlyerTextPricing("54.95"),
                  SizedBox(height: 50),
                  FlyerTextPricing("15.00"),
                  SizedBox(height: 50),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlyerText("6 Meses\n"),
                  SizedBox(height: 50),
                  FlyerTextPricing("44.95"),
                  SizedBox(height: 50),
                  FlyerTextPricing("15.00"),
                  SizedBox(height: 50),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlyerText("1 Año\n"),
                  SizedBox(height: 50),
                  FlyerTextPricing("34.95"),
                  SizedBox(height: 50),
                  FlyerTextPricing("15.00"),
                  SizedBox(height: 50),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlyerText("2 Años\n"),
                  SizedBox(height: 50),
                  FlyerTextPricing("29.95"),
                  SizedBox(height: 50),
                  FlyerTextPricing("15.00"),
                  SizedBox(height: 50),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlyerText("1 Año\nPago de golpe"),
                  SizedBox(height: 50),
                  FlyerTextPricing("400.68"),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AcropolisLogoWhite(),
              Column(
                children: [
                  SizedBox(height: 100),
                  FlyerText("¡ Todas Las clases grupales incluidas!"),
                  SizedBox(height: 25),
                  FlyerText("SPINNING,   HIIT,   BOOTCAMP,   ABS"),
                  SizedBox(height: 50),
                ],
              ),
              AcropolisLogoWhite()
            ],
          )
        ],
      ),
    ));
  }
}

class FlyerTextTitle extends StatelessWidget {
  FlyerTextTitle(this.lable);

  final String lable;
  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(fontFamily: 'edo', fontSize: 30, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}

class FlyerText extends StatelessWidget {
  FlyerText(this.lable);

  final String lable;
  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(fontFamily: 'edo', fontSize: 25, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}

class FlyerTextPricing extends StatelessWidget {
  FlyerTextPricing(this.lable);

  final String lable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("\$ ",
            style: TextStyle(fontSize: 22, color: Colors.white),
            textAlign: TextAlign.center),
        Text(lable,
            style:
                TextStyle(fontFamily: 'edo', fontSize: 25, color: Colors.white),
            textAlign: TextAlign.center),
      ],
    );
  }
}

class AcropolisLogoWhite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/AcropolisWhiteLogo.png",
        width: 150, height: 150);
  }
}


class InstagramSettingsTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return TextButton(
        onPressed: () => _urlInstagram(),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          const IconData(0xe800, fontFamily: 'InstagramIcon'),
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text("Instagram",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Divider(
                      color: Colors.white,
                    )),
              ],
            )));
  }
}







_urlInstagram() async {
  const url = 'https://www.instagram.com/acropolisfitness.mayaguez/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}