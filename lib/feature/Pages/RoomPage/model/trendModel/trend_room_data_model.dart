import 'package:chato/feature/Pages/RoomPage/model/trendModel/room_model.dart';
import 'package:json_annotation/json_annotation.dart';






part 'trend_room_data_model.g.dart';

@JsonSerializable()
class TrendRoomDataModel {

  int? id;
  RoomModel? room;



  Map<String, dynamic> toJson() => _$TrendRoomDataModelToJson(this);
  factory TrendRoomDataModel.fromJson(Map<String, dynamic> json) =>
      _$TrendRoomDataModelFromJson(json);

  TrendRoomDataModel(
      {
        required this.id,
        required this.room,
      });
}
