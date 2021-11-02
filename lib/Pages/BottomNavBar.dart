import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_acropolis/UI%20Assets/ScreenSize.dart';

import 'TrainerScreens/TrainerScreen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
//Marks where to start (on pressed) (middle icon)
  int pageIndex = 2;

//Makes starting page -should match pageIndex unles it's work-in-progress
  Widget _showPage = new TrainerPage();

  final TrainerPage _morePage = TrainerPage();
  final TrainerPage _timerPage = TrainerPage();
  final TrainerPage _trainerPage = TrainerPage();
  final TrainerPage _workOutsPage = TrainerPage();

  final TrainerPage _home = TrainerPage();
// Bottom Nav Bar Chooser DashboardScreen

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _morePage;
        break;
      case 1:
        return _timerPage;
        break;
      case 2:
        return _home;
        break;
      case 3:
        return _workOutsPage;
        break;
      case 4:
        return _trainerPage;
        break;

      default:
        return _home;
      /*
    return Container(
      child: new Center(
        child: new Text("Page not found")
      )
    );*/
    }
  }

  GlobalKey _bottomNavBarigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Color backgroundPallet1 = Color(0xfffffdf6);
    Color backgroundPallet2 = Color(0xffece8d9);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavBarigationKey,
            index: pageIndex,
            //height: 75,
            height: screenHeight(context) * 0.075,
            items: <Widget>[
              Icon(const IconData(0xe800, fontFamily: 'AcropolisIcon'),
                  size: screenWidth(context) * 0.055, color: Color(0xffece8d9)),
              Icon(Icons.timer,
                  size: screenWidth(context) * 0.06, color: Color(0xffece8d9)),
              Icon(Icons.dashboard,
                  size: screenWidth(context) * 0.06, color: Color(0xffece8d9)),
              Icon(Icons.fitness_center,
                  size: screenWidth(context) * 0.06, color: Color(0xffece8d9)),
              Icon(const IconData(0xe800, fontFamily: 'trainerIcon'),
                  size: screenWidth(context) * 0.06, color: Color(0xffece8d9)),
            ],
            color: Color(0xff0f0f0f), //navBarPallet,
            buttonBackgroundColor: Color(0xff0f0f0f), //navBarPallet,
            //match with contaner
            backgroundColor: Color(0xff0f0f0f), //navBarPallet,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 350),
            onTap: (int tappedIndex) {
              setState(() {
                _showPage = _pageChooser(tappedIndex);
              });
            },
          ),
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [backgroundPallet1, backgroundPallet2])),
              child: Center(child: _showPage))),
    );
  }
}
