/// GENERATED CODE - DO NOT MODIFY BY HAND [gen_routes.dart]
import 'package:flutter/material.dart';

import '../views/episode_detail/episode_detail_view.dart';
import '../views/episodes/episodes_view.dart';
import '../views/selection/selection_view.dart';
import '../views/splash/splash_view.dart';
import '../views/warning/warning_view.dart';
import 'routes.dart';

Widget? createView(String route) {
  switch (route) {
    case Routes.splash:
      return const SplashView();
    case Routes.warning:
      return const WarningView();
    case Routes.episodes:
      return const EpisodesView();
    case Routes.selection:
      return const SelectionView();
    case Routes.episodeDetail:
      return const EpisodeDetailView();
    default:
      return null;
  }
}
