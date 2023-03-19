import 'package:flutter/material.dart';


Color mainColor = const Color(0xff3E3832);
Color backgdColor = const Color(0xffffffff);
Color buttonsColor = const Color(0xff5B5249);
Color borderColor = const Color(0xffB3ABA8);
Color textColor = const Color(0xff000000);
Color textBorder = const Color(0xffD6872A);
Color arrowColor = const Color(0xffB98856);


///build material color from hex color
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}