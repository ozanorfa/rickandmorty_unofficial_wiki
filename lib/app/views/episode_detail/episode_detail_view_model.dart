import 'package:rickandmorty_unofficial_wiki/app/services/model/episode_model.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_episode.dart';
import 'package:rickandmorty_unofficial_wiki/app/views/episode_detail/episode_args.dart';

import '../../common/base_view_model.dart';

class EpisodeDetailViewModel extends BaseViewModel<EpisodeArgs> {
  ResultsEpisode get episode => args.resultsEpisode;
  @override
  void onBindingCreated() {
    episode.air_date;
  }
}
