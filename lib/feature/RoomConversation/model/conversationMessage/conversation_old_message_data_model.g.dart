// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_old_message_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationOldMessageDataModel _$ConversationOldMessageDataModelFromJson(
        Map<String, dynamic> json) =>
    ConversationOldMessageDataModel(
      id: json['id'] as int?,
      conversation_id: json['conversation_id'] as String?,
      message: json['message'] as String?,
      seen: json['seen'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      all_file: json['all_file'] as String?,
      localFile: json['localFile'] as String?,
    );

Map<String, dynamic> _$ConversationOldMessageDataModelToJson(
        ConversationOldMessageDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversation_id,
      'message': instance.message,
      'all_file': instance.all_file,
      'localFile': instance.localFile,
      'seen': instance.seen,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user': instance.user,
    };
