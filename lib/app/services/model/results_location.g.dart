// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsLocation _$ResultsLocationFromJson(Map<String, dynamic> json) =>
    ResultsLocation(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      dimension: json['dimension'] as String,
      residents:
          (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
      url: json['url'] as String,
    );

Map<String, dynamic> _$ResultsLocationToJson(ResultsLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'dimension': instance.dimension,
      'residents': instance.residents,
      'created': instance.created.toIso8601String(),
      'url': instance.url,
    };
