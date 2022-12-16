// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultsEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
