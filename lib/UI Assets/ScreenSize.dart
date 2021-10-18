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