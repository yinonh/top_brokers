import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;
  static const double designHeight = 926;
  static const double designWidth = 428;

  void init(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    orientation = MediaQuery.orientationOf(context);
  }
}

double calcHeight(double height) {
  return (height / SizeConfig.designHeight) * SizeConfig.screenHeight;
}

double calcWidth(double width) {
  return (width / SizeConfig.designWidth) * SizeConfig.screenWidth;
}
