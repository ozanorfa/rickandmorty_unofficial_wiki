import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

abstract class Themes {
  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
}
