// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_room_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendRoomDataModel _$TrendRoomDataModelFromJson(Map<String, dynamic> json) =>
    TrendRoomDataModel(
      id: json['id'] as int?,
      room: json['room'] == null
          ? null
          : RoomModel.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrendRoomDataModelToJson(TrendRoomDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room': instance.room,
    };
