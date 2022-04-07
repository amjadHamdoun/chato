import 'package:built_value/built_value.dart';

part 'room_conversation_state.g.dart';


abstract class RoomConversationState implements Built<RoomConversationState, RoomConversationStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool get showEmoji;
  bool get isRecord;



  RoomConversationState._();

  factory RoomConversationState([void Function(RoomConversationStateBuilder) updates]) = _$RoomConversationState;

  factory RoomConversationState.initial() {
    return RoomConversationState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..showEmoji=false
        ..isRecord=false

    );
  }
}


