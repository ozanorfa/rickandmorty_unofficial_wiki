import 'package:retrofit/retrofit.dart';

import '../model/episode_model.dart';

mixin EpisodesService {
  @GET('/episode')
  Future<EpisodeModel> getEpisodes();
}
