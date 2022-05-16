// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_old_message_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateOldMessageDataModel _$PrivateOldMessageDataModelFromJson(
        Map<String, dynamic> json) =>
    PrivateOldMessageDataModel(
      conversation_id: json['conversation_id'] as String?,
      message: json['message'] as String?,
      seen: json['seen'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrivateOldMessageDataModelToJson(
        PrivateOldMessageDataModel instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversation_id,
      'message': instance.message,
      'seen': instance.seen,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user': instance.user,
    };
