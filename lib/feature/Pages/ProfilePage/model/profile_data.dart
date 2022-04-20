import 'package:json_annotation/json_annotation.dart';

part 'profile_data.g.dart';

@JsonSerializable()
class ProfileData {
  final int? id;
  final String? name;
  final String? email;
  final String? img;
  final String? birth_date;
  final String? gender;
  final String? token;

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
  });
}
