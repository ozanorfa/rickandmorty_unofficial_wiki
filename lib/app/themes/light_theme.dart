part of 'themes.dart';

final ThemeData _lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.primarySecond,
    error: AppColors.pink,
  ),
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.primarySecond),
  brightness: Brightness.light,
);
