import 'package:flutter/material.dart';

const Color myRed = Color(0xFFD70026);
const Color white = Colors.white;

//Watery Wave
const Color hintColor = Colors.black54;
const Color textBoxBorderColor = Colors.black26;

//CircularChart
const Color boxShadowColor = Colors.black26;
const Color bottomBarTextIconColor = Color(0xFFA1A1AA);

const Color bgChartGradientColor1 = Color(0x45DCDCDC);
const Color bgChartGradientColor2 = Color(0x4AFDE1D7);

const Color chartGradientColor1 = Color(0xFFF5F5F5);
const Color chartGradientColor2 = Color(0xFFFDE1D7);

const Color chartBorderRingColor1 = Color(0x1A000000);
const Color chartBorderRingColor2 = myRed;

//App Theme Color
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach(
    (strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    },
  );
  return MaterialColor(color.value, swatch);
}
