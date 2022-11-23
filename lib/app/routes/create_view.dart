/// GENERATED CODE - DO NOT MODIFY BY HAND [gen_routes.dart]
import 'package:flutter/material.dart';

import '../views/selection/selection_view.dart';
import '../views/splash/splash_view.dart';
import 'routes.dart';

Widget? createView(String route) {
  switch (route) {
    case Routes.splash:
      return const SplashView();
    case Routes.selection:
      return const SelectionView();
    default:
      return null;
  }
}
