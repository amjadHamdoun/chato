// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyNotificationModel _$VerifyNotificationModelFromJson(
        Map<String, dynamic> json) =>
    VerifyNotificationModel(
      data: VerifyNotificationDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      error_code: json['error_code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$VerifyNotificationModelToJson(
        VerifyNotificationModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'error_code': instance.error_code,
      'data': instance.data,
    };
