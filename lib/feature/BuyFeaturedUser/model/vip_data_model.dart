import 'package:json_annotation/json_annotation.dart';





part 'vip_data_model.g.dart';

@JsonSerializable()
class VipDataModel {


  var vip_id;
  String? price;
  final DateTime? end_date;
  final DateTime? start_date;



  Map<String, dynamic> toJson() => _$VipDataModelToJson(this);
  factory VipDataModel.fromJson(Map<String, dynamic> json) =>
      _$VipDataModelFromJson(json);

  VipDataModel(
      {

        required this.vip_id,
        required this.price,
        required this.end_date,
        required this.start_date
      });
}
