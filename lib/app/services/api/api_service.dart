import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/api/episodes_service.dart';

import '../model/episode_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api")
abstract class APIService with EpisodesService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;
}
