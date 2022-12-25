import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/location_character_model.dart';

part 'results_character.g.dart';

@JsonSerializable()
class ResultsCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final List<String> episode;
  final DateTime created;
  final String url;
  final String image;
  final LocationCharacter location;
  final LocationCharacter origin;

  ResultsCharacter(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.episode,
      required this.created,
      required this.url,
      required this.image,
      required this.origin,
      required this.location});
  factory ResultsCharacter.fromJson(Map<String, dynamic> json) =>
      _$ResultsCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsCharacterToJson(this);
}
