import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty_unofficial_wiki/app/services/model/results_character.dart';

import 'info_model.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  Info info;
  List<ResultsCharacter> results;

  CharacterModel({required this.info, required this.results});
  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
