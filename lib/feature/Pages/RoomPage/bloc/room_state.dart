
import 'package:built_value/built_value.dart';

import '../model/create_room_model.dart';
part 'room_state.g.dart';


abstract class RoomState implements Built<RoomState, RoomStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  int get selectedFilter;
  String get error;
  CreateRoomModel get createRoomModel;


  RoomState._();

  factory RoomState([void Function(RoomStateBuilder) updates])
  = _$RoomState;

  factory RoomState.initial() {
    return RoomState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..selectedFilter=0
        ..error=''
        ..createRoomModel=CreateRoomModel(error_code: 0,
          message: '',
          status: false

        )

    );
  }
}


