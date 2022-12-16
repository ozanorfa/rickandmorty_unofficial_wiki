import 'package:rickandmorty_unofficial_wiki/app/services/model/episode_model.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_episode.dart';
import 'package:rickandmorty_unofficial_wiki/app/utils/shared.dart';

import '../../common/base_view_model.dart';
import '../../constants/app_strings.dart';

class EpisodesViewModel extends BaseViewModel {
  late EpisodeModel episodeModel;
  List<ResultsEpisode> resultEpisodeList = [];

  @override
  void onBindingCreated() {
    getEpisodes();
  }

  void getEpisodes() {
    flow(() async {
      episodeModel = await apiService.getEpisodes();
      resultEpisodeList.addAll(episodeModel.results);
    });
  }

  String getEpisodeSeasonText(String episode) {
    return "${AppStrings.season} ${getSeason(episode)}  -  ${AppStrings.episode} ${getEpisode(episode)}";
  }

  void onItemTapped(ResultsEpisode resultsEpisode) {}
}
