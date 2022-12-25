import 'package:flutter/material.dart';

mixin AppColors {
  static const Color primary = Color(0xFF97ce4c);
  static const Color primarySecond = Color(0xFF4DAE9D);
  static const Color primaryYellow = Color(0xFFf0e14a);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF40456C);
  static const Color lightBlue = Color(0xFF2EBEEF);
  static const Color blue = Color(0xFF0000FF);
  static const Color lightGray = Color(0xFFE5E6EB);
  static const Color darkGray = Color(0xFFAAAAAA);
  static const Color pink = Color(0xFFFF7791);
  static const Color red = Color(0xFFFF0000);
  static const Color darkRed = Color(0xFFD76370);
  static const Color lightGreen = Color(0xFF00FF00);
  static const Color green = Color(0xFF63CE7E);
  static const Color teal = Color(0xFF4DAE9D);

  static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryYellow,
      primary,
      primarySecond,
    ],
  );
}
