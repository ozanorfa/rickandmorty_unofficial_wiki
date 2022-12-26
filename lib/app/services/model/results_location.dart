import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/location_character_model.dart';

part 'results_location.g.dart';

@JsonSerializable()
class ResultsLocation {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final DateTime created;
  final String url;

  ResultsLocation({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.created,
    required this.url,
  });
  factory ResultsLocation.fromJson(Map<String, dynamic> json) =>
      _$ResultsLocationFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsLocationToJson(this);
}
