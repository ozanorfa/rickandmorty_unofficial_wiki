import 'package:flutter/material.dart'
    show
        BuildContext,
        Key,
        MaterialApp,
        MediaQuery,
        Size,
        StatelessWidget,
        Widget;
import 'package:flutter/services.dart';

import '../routes/generated_routes.dart';
import '../routes/routes.dart';
import '../themes/themes.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      theme: Themes.lightTheme,
      builder: _onTransitionBuilder,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.splash,
    );
  }

  Widget _onTransitionBuilder(context, widget) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: widget!,
    );
  }
}
