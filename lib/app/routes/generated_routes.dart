import 'package:flutter/material.dart';

import 'create_view.dart';

Route? onGenerateRoute(RouteSettings settings) {
  if (settings.name != null) {
    final child = createView(settings.name!);

    if (child != null) {
      return MaterialPageRoute(builder: (_) => child, settings: settings);
    }
  }
  return null;
}
