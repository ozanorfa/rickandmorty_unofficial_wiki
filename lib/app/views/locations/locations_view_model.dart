import 'package:flutter/material.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/location_model.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_location.dart';

import '../../common/base_view_model.dart';
import '../../services/model/info_model.dart';
import '../../utils/shared.dart';

class LocationsViewModel extends BaseViewModel {
  late LocationModel locationModel;
  late Info info;
  List<ResultsLocation> resultLocationsList = [];
  ScrollController listviewController = ScrollController();

  @override
  void onBindingCreated() {
    getLocations();

    listviewController.addListener(() {
      if (listviewController.position.pixels ==
          listviewController.position.maxScrollExtent) {
        getLocationsWithPage();
      }
    });
  }

  void getLocations() {
    flow(() async {
      locationModel = await apiService.getLocations();
      info = locationModel.info;
      resultLocationsList.addAll(locationModel.results);
    });
  }

  void getLocationsWithPage() {
    flow(() async {
      String? nextLink = info.next;
      if (nextLink != null) {
        String character = nextLink.substring(nextLink.length - 1);
        locationModel = await apiService.getLocationsWithPage(character);
        info = locationModel.info;
        resultLocationsList.addAll(locationModel.results);
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
}
