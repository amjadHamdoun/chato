import 'package:json_annotation/json_annotation.dart';






part 'fav_room_data_model.g.dart';

@JsonSerializable()
class FavRoomDataModel {

  int? id;
  String? name;



  Map<String, dynamic> toJson() => _$FavRoomDataModelToJson(this);
  factory FavRoomDataModel.fromJson(Map<String, dynamic> json) =>
      _$FavRoomDataModelFromJson(json);

  FavRoomDataModel(
      {
        required this.id,
        required this.name,
      });
}
