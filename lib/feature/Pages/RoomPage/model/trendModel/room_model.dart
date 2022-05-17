import 'package:json_annotation/json_annotation.dart';






part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {

  int? id;
  String? name;
  String? img;



  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  RoomModel(
      {
        required this.id,
        required this.name,
        required this.img
      });
}
