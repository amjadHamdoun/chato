// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_room_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavRoomDataModel _$FavRoomDataModelFromJson(Map<String, dynamic> json) =>
    FavRoomDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      background: json['background'] == null
          ? null
          : BackgroundRoomModel.fromJson(
              json['background'] as Map<String, dynamic>),
      favorite_room_count: json['favorite_room_count'],
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      img: json['img'] as String?,
    );

Map<String, dynamic> _$FavRoomDataModelToJson(FavRoomDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favorite_room_count': instance.favorite_room_count,
      'user': instance.user,
      'background': instance.background,
      'img': instance.img,
    };
