import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/api/characters_service.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/api/episodes_service.dart';

import '../model/character_model.dart';
import '../model/episode_model.dart';
import '../model/results_episode.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api")
abstract class APIService with EpisodesService, CharactersService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;
}
