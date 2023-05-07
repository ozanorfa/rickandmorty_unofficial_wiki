import 'package:rickandmorty_unofficial_wiki/app/services/model/results_episode.dart';
import 'package:rickandmorty_unofficial_wiki/app/views/characters/characters_args.dart';
import 'package:rickandmorty_unofficial_wiki/app/views/episode_detail/episode_args.dart';

import '../../common/base_view_model.dart';
import '../../routes/routes.dart';

class EpisodeDetailViewModel extends BaseViewModel<EpisodeArgs> {
  ResultsEpisode get episode => args.resultsEpisode;
  @override
  void onBindingCreated() {}

  void goToViewCharacters() {
    var urls = episode.characters;
    final lastIds = urls.map((url) => url.split('/').last).toList();
    final result = lastIds.toString().replaceAll(' ', '');

    navigate(Routes.characters, args: CharacterArgs(characterList: result));
  }
}
