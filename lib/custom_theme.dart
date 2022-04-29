import 'package:flutter/material.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color.fromARGB(255, 247, 65, 165);
  static const Color loginGradientEnd = Color.fromARGB(255, 46, 18, 18);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color black38 = Colors.black38;
  static const Color green = Colors.green;
  static Color green700 = Colors.green.shade700;
  static Color grey50 = Colors.grey.shade50.withOpacity(0.1);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
