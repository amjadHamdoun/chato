// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      img: json['img'] as String?,
      birth_date: json['birth_date'] as String?,
      gender: json['gender'] as String?,
      vip_user: json['vip_user'] == null
          ? null
          : VipDataModel.fromJson(json['vip_user'] as Map<String, dynamic>),
      gift_transaction_r: json['gift_transaction_r'] as List<dynamic>?,
      gift_transaction_s: json['gift_transaction_s'] as List<dynamic>?,
      block: json['block'] as List<dynamic>?,
      friend: json['friend'] as List<dynamic>?,
      userfriend: json['userfriend'] == null
          ? null
          : UserFriend.fromJson(json['userfriend'] as Map<String, dynamic>),
      userfrien: json['userfrien'] == null
          ? null
          : UserFriend.fromJson(json['userfrien'] as Map<String, dynamic>),
      viewers: json['viewers'],
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'img': instance.img,
      'birth_date': instance.birth_date,
      'gender': instance.gender,
      'token': instance.token,
      'gift_transaction_s': instance.gift_transaction_s,
      'gift_transaction_r': instance.gift_transaction_r,
      'userfriend': instance.userfriend,
      'userfrien': instance.userfrien,
      'friend': instance.friend,
      'block': instance.block,
      'viewers': instance.viewers,
      'vip_user': instance.vip_user,
    };
