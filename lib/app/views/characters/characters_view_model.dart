import 'package:rickandmorty_unofficial_wiki/app/services/model/character_model.dart';

import '../../common/base_view_model.dart';
import '../../services/model/info_model.dart';
import '../../services/model/results_character.dart';
import '../../utils/shared.dart';

class CharactersViewModel extends BaseViewModel {
  late CharacterModel characterModel;
  late Info info;
  List<ResultsCharacter> resultCharactersList = [];

  @override
  void onBindingCreated() {
    getCharacters();
  }

  void getCharacters() {
    flow(() async {
      characterModel = await apiService.getCharacters();
      info = characterModel.info;
      resultCharactersList.addAll(characterModel.results);
    });
  }
}
