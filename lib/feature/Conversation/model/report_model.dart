import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable()
class ReportModel {
  bool? status;
  int? error_code;
  String? data;

  Map<String, dynamic> toJson() =>
      _$ReportModelToJson(this);
  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  ReportModel(
      {
        required this.error_code,
        required this.data,
        required this.status
      });
}
