// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsCharacter _$ResultsCharacterFromJson(Map<String, dynamic> json) =>
    ResultsCharacter(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
      url: json['url'] as String,
      image: json['image'] as String,
      origin:
          LocationCharacter.fromJson(json['origin'] as Map<String, dynamic>),
      location:
          LocationCharacter.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultsCharacterToJson(ResultsCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'episode': instance.episode,
      'created': instance.created.toIso8601String(),
      'url': instance.url,
      'image': instance.image,
      'location': instance.location,
      'origin': instance.origin,
    };
