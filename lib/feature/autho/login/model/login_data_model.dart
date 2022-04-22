import 'package:json_annotation/json_annotation.dart';

part 'login_data_model.g.dart';

@JsonSerializable()
class LoginDataModel {

  int? id;
  String? name;
  String? email;
  String? token;



  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);
  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  LoginDataModel(
      {
        required this.id,
        required this.name,
        required this.email,
        required this.token
      });
}