import 'package:flutter/material.dart';

//This Function scales to the width of the Screen

double scaleWidth( double value, BuildContext context) {
  return MediaQuery.of(context).size.width * (value / 320);
}

double scaleHeight(double value, BuildContext context) {
  return MediaQuery.of(context).size.height * (value / 616);
}

