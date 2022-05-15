import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  final int? id;
  final String? name_ar;
  final String? name_en;


  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  CountryModel( {
    required this.id,
    required this.name_ar,
    required this.name_en,

  });
}
