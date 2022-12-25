import 'package:flutter/widgets.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/episode_model.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/info_model.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_episode.dart';
import 'package:rickandmorty_unofficial_wiki/app/utils/shared.dart';
import 'package:rickandmorty_unofficial_wiki/app/views/episode_detail/episode_args.dart';

import '../../common/base_view_model.dart';
import '../../constants/app_strings.dart';
import '../../routes/routes.dart';

class EpisodesViewModel extends BaseViewModel {
  late EpisodeModel episodeModel;
  late Info info;
  List<ResultsEpisode> resultEpisodeList = [];
  ScrollController listviewController = ScrollController();

  @override
  void onBindingCreated() {
    getEpisodes();

    listviewController.addListener(() {
      if (listviewController.position.pixels ==
          listviewController.position.maxScrollExtent) {
        getEpisodesWithPage();
      }
    });
  }

  void getEpisodes() {
    flow(() async {
      episodeModel = await apiService.getEpisodes();
      info = episodeModel.info;
      resultEpisodeList.addAll(episodeModel.results);
    });
  }

  void getEpisodesWithPage() {
    flow(() async {
      String? nextLink = info.next;
      if (nextLink != null) {
        String episode = nextLink.substring(nextLink.length - 1);
        episodeModel = await apiService.getEpisodesWithPage(episode);
        info = episodeModel.info;
        resultEpisodeList.addAll(episodeModel.results);
      }
    });
  }

  String getEpisodeSeasonText(String episode) {
    return "${AppStrings.season} ${getSeason(episode)}  -  ${AppStrings.episode} ${getEpisode(episode)}";
  }

  void onItemTapped(int id) {
    //TODO: uncomment after implementation

    /*flow(() async {
      ResultsEpisode resultsEpisode =
          await apiService.getSingleEpisode(id.toString());
      navigate(Routes.episodeDetail,
          args: EpisodeArgs(resultsEpisode: resultsEpisode));
    });*/
  }

  @override
  void dispose() {
    listviewController.dispose();
    super.dispose();
  }
}
