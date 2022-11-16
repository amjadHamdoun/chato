import 'package:chato/feature/Pages/ProfilePage/model/verifyEmailNotification/verify_notification_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_notification_model.g.dart';

@JsonSerializable()
class VerifyNotificationModel {

  String? message;
  bool? status;
  int? error_code;
  VerifyNotificationDataModel data;

  Map<String, dynamic> toJson() => _$VerifyNotificationModelToJson(this);
  factory VerifyNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyNotificationModelFromJson(json);

  VerifyNotificationModel({
    required this.data,
    required this.status,
    required this.error_code,
    required this.message

  });
}