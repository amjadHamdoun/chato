



import 'package:built_value/built_value.dart';



part 'room_state.g.dart';


abstract class RoomState implements Built<RoomState, RoomStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
 int get selectedFilter;



  RoomState._();

  factory RoomState([void Function(RoomStateBuilder) updates]) = _$RoomState;

  factory RoomState.initial() {
    return RoomState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..selectedFilter=0

    );
  }
}


