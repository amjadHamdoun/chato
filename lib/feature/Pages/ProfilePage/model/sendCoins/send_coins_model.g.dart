// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_coins_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCoinsModel _$SendCoinsModelFromJson(Map<String, dynamic> json) =>
    SendCoinsModel(
      data: json['data'] as String?,
      status: json['status'] as bool?,
      error_code: json['error_code'] as int?,
    );

Map<String, dynamic> _$SendCoinsModelToJson(SendCoinsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'error_code': instance.error_code,
    };
