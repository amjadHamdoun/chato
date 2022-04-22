// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    LoginDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
    };
