import 'package:json_annotation/json_annotation.dart';

part 'location_character_model.g.dart';

@JsonSerializable()
class LocationCharacter {
  final String name;
  final String url;

  LocationCharacter({
    required this.name,
    required this.url,
  });

  factory LocationCharacter.fromJson(Map<String, dynamic> json) =>
      _$LocationCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$LocationCharacterToJson(this);
}
