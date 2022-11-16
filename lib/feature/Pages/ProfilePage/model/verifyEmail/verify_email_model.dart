import 'package:chato/feature/Pages/ProfilePage/model/verifyEmail/verify_email_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_email_model.g.dart';

@JsonSerializable()
class VerifyEmailModel {

  String? message;
  bool? status;
  int? error_code;
  VerifyEmailDataModel data;

  Map<String, dynamic> toJson() => _$VerifyEmailModelToJson(this);
  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailModelFromJson(json);

  VerifyEmailModel({
    required this.data,
    required this.status,
    required this.error_code,
    required this.message

  });
}