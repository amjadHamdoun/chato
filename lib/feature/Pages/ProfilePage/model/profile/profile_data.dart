import 'package:json_annotation/json_annotation.dart';

import 'country_model.dart';

part 'profile_data.g.dart';

@JsonSerializable()
class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? img;
  final String? birth_date;
   String? gender;
  final String? token;
  final String? status;
 final CountryModel? country;
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  ProfileData( {
    required this.token,
    required this.name,
    required this.email,
    required this.id,
    required this.img,
    required this.birth_date,
    required this.gender,
    required this.status,
    required this.country
  });
}
