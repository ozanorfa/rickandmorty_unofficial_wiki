import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_episode.dart';

import 'info_model.dart';
part 'episode_model.g.dart';

@JsonSerializable() // #2
class EpisodeModel {
  Info info;
  List<ResultsEpisode> results;

  EpisodeModel({required this.info, required this.results});
  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
