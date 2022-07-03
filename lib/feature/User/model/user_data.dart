import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? img;
  final String? birth_date;
  final String? gender;
  final String? token;
  var  vip_user;
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  UserData( {
     this.token,
     this.name,
     this.email,
     this.id,
     this.img,
     this.birth_date,
     this.gender,
     this.vip_user

  });
}
