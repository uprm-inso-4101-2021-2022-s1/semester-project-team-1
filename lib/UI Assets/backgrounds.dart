import 'package:flutter/material.dart';

import 'ScreenSize.dart';

gradientBackground(context) {
  return Stack(
    children: [
      Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/images/Backgrounds/crossTraining.jpg"),
                fit: BoxFit.cover)),
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [Colors.black45, Colors.black87])),
      )
    ],
  );
}
