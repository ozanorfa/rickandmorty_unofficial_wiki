import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty_unofficial_wiki/app/themes/themes.dart';

part 'results_episode.g.dart';

@JsonSerializable()
class ResultsEpisode {
  final int id;
  final String name;
  final String air_date;
  final String episode;
  final String url;
  final DateTime created;
  final List<String> characters;

  ResultsEpisode({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.url,
    required this.created,
    required this.characters,
  });
  factory ResultsEpisode.fromJson(Map<String, dynamic> json) =>
      _$ResultsEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsEpisodeToJson(this);
}
