import 'package:json_annotation/json_annotation.dart';

part 'verify_notification_data_model.g.dart';

@JsonSerializable()
class VerifyNotificationDataModel {

  int? code;
  String? email;


  Map<String, dynamic> toJson() => _$VerifyNotificationDataModelToJson(this);
  factory VerifyNotificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyNotificationDataModelFromJson(json);

  VerifyNotificationDataModel(
      {
        required this.code,
        required this.email,
      });
}