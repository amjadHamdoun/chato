import 'package:json_annotation/json_annotation.dart';

import '../../../../User/model/user_data.dart';






part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {

  int? id;
  String? name;
  final String? favorite_room_count;
  final UserData? user;
  final String? background;
  final String? img;



  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  RoomModel(
      {
        required this.id,
        required this.name,
        required this.img,
        required this.user,
        required this.favorite_room_count,
        required this.background
      });
}
