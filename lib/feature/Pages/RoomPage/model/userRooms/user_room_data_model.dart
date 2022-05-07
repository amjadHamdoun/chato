import 'package:json_annotation/json_annotation.dart';






part 'user_room_data_model.g.dart';

@JsonSerializable()
class UserRoomDataModel {

  int? id;
  String? name;



  Map<String, dynamic> toJson() => _$UserRoomDataModelToJson(this);
  factory UserRoomDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoomDataModelFromJson(json);

  UserRoomDataModel(
      {
        required this.id,
        required this.name,
      });
}
