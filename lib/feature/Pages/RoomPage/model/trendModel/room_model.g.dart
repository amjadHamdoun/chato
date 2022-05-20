// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      img: json['img'] as String?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      favorite_room_count: json['favorite_room_count'] as String?,
      background: json['background'] as String?,
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favorite_room_count': instance.favorite_room_count,
      'user': instance.user,
      'background': instance.background,
      'img': instance.img,
    };
