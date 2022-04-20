import 'package:json_annotation/json_annotation.dart';

part 'register_data_model.g.dart';

@JsonSerializable()
class RegisterDataModel {

  int? id;
   String? name;
  String? email;
  String? token;



  Map<String, dynamic> toJson() => _$RegisterDataModelToJson(this);
  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);

  RegisterDataModel(
      {
        required this.id,
        required this.name,
        required this.email,
        required this.token
      });
}