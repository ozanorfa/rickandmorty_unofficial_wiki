import 'package:flutter/material.dart';

mixin AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF40456C);
  static const Color darkBlue = Color(0xFF2F2A95);
  static const Color blue = Color(0xFF2DACCD);
  static const Color lightBlue = Color(0xFF2EBEEF);
  static const Color lightGray = Color(0xFFE5E6EB);
  static const Color darkGray = Color(0xFFAAAAAA);
  static const Color red = Color(0xFFFF7791);
  static const Color darkRed = Color(0xFFD76370);
  static const Color green = Color(0xFF63CE7E);
  static const Color teal = Color(0xFF4DAE9D);
  static const Color purple = Color(0xFF8176C4);
  static const Color lightPurple = Color(0xFFA3A2DE);

  static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      darkBlue,
      lightBlue,
    ],
  );

  static const LinearGradient appGradientHorizontal = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      darkBlue,
      lightBlue,
      white,
    ],
  );
}
