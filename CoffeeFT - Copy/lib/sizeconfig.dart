import 'package:flutter/material.dart';

class sizeconfiguration {
  static late MediaQueryData _mediaQueryData;
  static late double screenwidth;
  static late double screenheight;
  static late Orientation orientation;

  void access(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenwidth = _mediaQueryData.size.width;
    screenheight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

}

double getproportionatescreenheight(double givenheight) {
  double Screenheight = sizeconfiguration.screenheight;
  return (givenheight / 812.0) * Screenheight;
}

double getproportionatescreenwidth(double givenheight) {
  double Screenwidth = sizeconfiguration.screenwidth;
  return (givenheight / 812.0) * Screenwidth;
}
