import 'package:json_annotation/json_annotation.dart';

import 'info_model.dart';
import 'results_location.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  Info info;
  List<ResultsLocation> results;

  LocationModel({required this.info, required this.results});
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
