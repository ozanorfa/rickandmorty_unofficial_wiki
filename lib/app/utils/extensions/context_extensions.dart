import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  Color get backgroundColor => theme.backgroundColor;

  Color get primaryColor => theme.primaryColor;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  TargetPlatform get _platform => Theme.of(this).platform;

  bool get isAndroid => _platform == TargetPlatform.android;

  bool get isIOS => _platform == TargetPlatform.iOS;

  TextStyle? get headline1 => textTheme.headline1;

  TextStyle? get headline2 => textTheme.headline2;

  TextStyle? get headline3 => textTheme.headline3;

  TextStyle? get headline4 => textTheme.headline4;

  TextStyle? get headline5 => textTheme.headline5;

  TextStyle? get headline6 => textTheme.headline6;

  TextStyle? get subtitle1 => textTheme.subtitle1;

  TextStyle? get subtitle2 => textTheme.subtitle2;

  TextStyle? get bodyText1 => textTheme.bodyText1;

  TextStyle? get bodyText2 => textTheme.bodyText2;

  TextStyle? get caption => textTheme.caption;

  TextStyle? get button => textTheme.button;

  TextStyle? get overline => textTheme.overline;
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  double get _defaultPadding => 16;

  double get _smallPadding => 10;

  double get bottomPadding => mediaQuery.padding.bottom;

  double get bottomPhoneMargin => mediaQuery.viewPadding.bottom;
}
