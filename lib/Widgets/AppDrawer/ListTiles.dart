import 'package:acropolis_member_management/Routes/route_names.dart';
import 'package:flutter/material.dart';

//First Attempt to minimize listTile code for AppDrawer, did not work, makes the screen black, however the tile IS loading
// i suspect there is an error with the bools or the async functions
class CustomListTileTheme extends StatefulWidget {
  CustomListTileTheme(
    this.tileTextTitle,
    this.onTapNavigation,
    this.selected,
    this.selectedd,
  );
  final String tileTextTitle;
  final Future<void> onTapNavigation;
  final String selected;
  final String selectedd;

  @override
  _CustomListTileThemeState createState() => _CustomListTileThemeState();
}

class _CustomListTileThemeState extends State<CustomListTileTheme> {
  String _selectedRoute;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      iconColor: Color(0xffE7E7E7),
      child: ListTile(
        leading: Icon(Icons.dashboard_rounded),
        title: Text(widget.tileTextTitle),
        onTap: () async {
          await widget.onTapNavigation;
        },
        selected: _selectedRoute == widget.selectedd,
      ),
    );
  }
}

class SelectedTileDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "•\n",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.grey,
            fontSize: 40),
      
    );
  }
}
