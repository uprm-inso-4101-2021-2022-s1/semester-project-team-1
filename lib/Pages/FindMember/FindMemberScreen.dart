import 'package:acropolis_member_management/Pages/FindMember/MemberProfileScreen.dart';
import 'package:acropolis_member_management/Pages/FindMember/SearchByFirstName.dart';
import 'package:acropolis_member_management/Pages/FindMember/SearchByLastName.dart';
import 'package:acropolis_member_management/Pages/FindMember/SearchByMemberID.dart';
import 'package:acropolis_member_management/Widgets/AppDrawer/AppScaffold.dart';
import 'package:acropolis_member_management/Widgets/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Last10Members.dart';

class FindMemberScreen extends StatefulWidget {
  @override
  _FindMemberScreenState createState() => _FindMemberScreenState();
}

class _FindMemberScreenState extends State<FindMemberScreen> {
  final TextEditingController firstNameSearchController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SearchButton("Search by Member ID", SearchByMemberID(),
                FontAwesomeIcons.idCard),
            SearchButton(
                "Search by First Name", SearchByFirstName(), Icons.search),
            SearchButton(
                "Search by Last Name", SearchByLastName(), Icons.search),
            SearchButton(
                "Last 10 Members Added", Last10MembersAdded(), Icons.search),
          ],
        )
      ],
    ));
  }
}

class SearchButton extends StatefulWidget {
  SearchButton(this.lable, this.widget, this.icon);
  final Widget widget;
  final String lable;
  final IconData icon;
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth(context) * 0.01,
              top: screenWidth(context) * 0.1),
          child: Container(
              height: screenHeight(context) * 0.1,
              width: screenWidth(context) * 0.5,
              decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                  color: Color(0xFF1B1B1B), //Color(0xFF1B1B1B),
                  borderRadius: new BorderRadius.all(Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    widget.lable,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Neuton',
                    ),
                  )
                ],
              ))),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget.widget));
      },
    );
  }
}
