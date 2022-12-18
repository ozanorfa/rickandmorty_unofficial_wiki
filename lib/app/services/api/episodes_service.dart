import 'package:retrofit/retrofit.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_episode.dart';

import '../model/episode_model.dart';

mixin EpisodesService {
  @GET('/episode')
  Future<EpisodeModel> getEpisodes();

  @GET('/episode?page={page}')
  Future<EpisodeModel> getEpisodesWithPage(@Path("page") String page);

  @GET('/episode/{episode}')
  Future<ResultsEpisode> getSingleEpisode(@Path("episode") String episode);
}
