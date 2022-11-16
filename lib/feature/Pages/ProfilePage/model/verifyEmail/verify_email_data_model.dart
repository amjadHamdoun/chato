import 'package:json_annotation/json_annotation.dart';

part 'verify_email_data_model.g.dart';

@JsonSerializable()
class VerifyEmailDataModel {

  String? email_verified_at;


  Map<String, dynamic> toJson() => _$VerifyEmailDataModelToJson(this);
  factory VerifyEmailDataModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailDataModelFromJson(json);

  VerifyEmailDataModel(
      {
       required this.email_verified_at
      });
}