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

/*
screenWcard(context) {
  return screenWidth(context) * 0.40;
}

screenHcard(context) {
  return screenHeight(context) * 0.27;
}
*/
workoutTextSize(context) {
  return MediaQuery.of(context).size.width / 15;
}

importantMessageTextSize(context) {
  return MediaQuery.of(context).size.width / 17;
}



horizontalCardW(context) {
  return screenWidth(context) * 0.92;
}

horizontalCardH(context) {
  return screenHeight(context) * 0.18;
}