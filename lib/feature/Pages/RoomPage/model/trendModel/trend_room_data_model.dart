import 'package:chato/feature/Pages/RoomPage/model/trendModel/room_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../User/model/user_data.dart';






part 'trend_room_data_model.g.dart';

@JsonSerializable()
class TrendRoomDataModel {

  int? id;
  RoomModel? room;
  final String? favorite_room_count;
  final UserData? user;
  final String? background;
  final String? img;


  Map<String, dynamic> toJson() => _$TrendRoomDataModelToJson(this);
  factory TrendRoomDataModel.fromJson(Map<String, dynamic> json) =>
      _$TrendRoomDataModelFromJson(json);

  TrendRoomDataModel(
      {
        required this.id,
        required this.room,
        required this.img,
        required this.background,
        required this.favorite_room_count,
        required this.user
      });
}
