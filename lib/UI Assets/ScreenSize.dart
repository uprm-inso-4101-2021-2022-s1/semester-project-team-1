import 'package:flutter/material.dart';

screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

screenWcard(context) {
  return screenWidth(context) * 0.45;
}

screenHcard(context) {
  return screenHeight(context) * 0.25;
}

backButton(context) {
  return //Back button stacked
      Padding(
    padding: EdgeInsets.only(top: 30, left: 10),
    child: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.grey,
        size: 40,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
