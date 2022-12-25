import 'package:flutter/widgets.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/character_model.dart';

import '../../common/base_view_model.dart';
import '../../services/model/info_model.dart';
import '../../services/model/results_character.dart';
import '../../utils/enums/character_enum.dart';
import '../../utils/shared.dart';

class CharactersViewModel extends BaseViewModel {
  late CharacterModel characterModel;
  late Info info;
  List<ResultsCharacter> resultCharactersList = [];
  ScrollController listviewController = ScrollController();

  @override
  void onBindingCreated() {
    getCharacters();

    listviewController.addListener(() {
      if (listviewController.position.pixels ==
          listviewController.position.maxScrollExtent) {
        getCharactersWithPage();
      }
    });
  }

  void getCharacters() {
    flow(() async {
      characterModel = await apiService.getCharacters();
      info = characterModel.info;
      resultCharactersList.addAll(characterModel.results);
    });
  }

  void getCharactersWithPage() {
    flow(() async {
      String? nextLink = info.next;
      if (nextLink != null) {
        String character = nextLink.substring(nextLink.length - 1);
        characterModel = await apiService.getCharactersWithPage(character);
        info = characterModel.info;
        resultCharactersList.addAll(characterModel.results);
      }
    });
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

  getGenderColour(String gender) {
    Gender genderEnum = Gender.values.byName(gender.toLowerCase());
    return genderEnum.iconColour;
  }

  getStatusColour(String status) {
    Status statusEnum = Status.values.byName(status.toLowerCase());
    return statusEnum.iconColour;
  }
}
