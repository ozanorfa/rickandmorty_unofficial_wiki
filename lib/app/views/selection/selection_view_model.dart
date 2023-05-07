import 'package:rickandmorty_unofficial_wiki/app/views/characters/characters_args.dart';

import '../../common/base_view_model.dart';
import '../../routes/routes.dart';

class SelectionViewModel extends BaseViewModel {
  @override
  void onBindingCreated() {}

  void onPressedEpisodes() {
    navigate(Routes.episodes);
  }

  void onPressedCharacters() {
    navigate(Routes.characters, args: const CharacterArgs(characterList: null));
  }

  void onPressedLocations() {
    navigate(Routes.locations);
  }

  void onPressedInfoApp() {
    navigate(Routes.appInfo);
  }
}
