import 'package:acropolis_member_management/Widgets/AppDrawer/AppDrawer.dart';
import 'package:flutter/material.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatelessWidget {
  const AppScaffold({this.body, Key key}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    //final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[800],
            Colors.grey[900],
          ],
        )),
        child: Row(
          children: [
            AppDrawer(permanentlyDisplay: true),
            Expanded(
                child: Scaffold(
              body: SingleChildScrollView(child: body),
            ))
          ],
        ));
  }
}
