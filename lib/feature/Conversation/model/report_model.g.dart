// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      error_code: json['error_code'] as int?,
      data: json['data'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error_code': instance.error_code,
      'data': instance.data,
    };
