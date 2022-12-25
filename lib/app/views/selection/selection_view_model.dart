import '../../common/base_view_model.dart';
import '../../routes/routes.dart';

class SelectionViewModel extends BaseViewModel {
  @override
  void onBindingCreated() {}

  void onPressedEpisodes() {
    navigate(Routes.episodes);
  }

  void onPressedCharacters() {
    navigate(Routes.characters);
  }

  void onPressedLocations() {}
}
