import 'package:json_annotation/json_annotation.dart';






part 'all_room_data_model.g.dart';

@JsonSerializable()
class AllRoomDataModel {

  int? id;
  String? name;



  Map<String, dynamic> toJson() => _$AllRoomDataModelToJson(this);
  factory AllRoomDataModel.fromJson(Map<String, dynamic> json) =>
      _$AllRoomDataModelFromJson(json);

  AllRoomDataModel(
      {
        required this.id,
        required this.name,
      });
}
