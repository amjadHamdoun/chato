// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyNotificationDataModel _$VerifyNotificationDataModelFromJson(
        Map<String, dynamic> json) =>
    VerifyNotificationDataModel(
      code: json['code'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$VerifyNotificationDataModelToJson(
        VerifyNotificationDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
    };
