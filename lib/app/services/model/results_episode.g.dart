// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsEpisode _$ResultsEpisodeFromJson(Map<String, dynamic> json) =>
    ResultsEpisode(
      id: json['id'] as int,
      name: json['name'] as String,
      air_date: json['air_date'] as String,
      episode: json['episode'] as String,
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ResultsEpisodeToJson(ResultsEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.air_date,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created.toIso8601String(),
      'characters': instance.characters,
    };
