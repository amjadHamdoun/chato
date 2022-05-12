import 'package:built_value/built_value.dart';

import '../model/conversation_old_message_model.dart';

part 'room_conversation_state.g.dart';


abstract class RoomConversationState implements Built<RoomConversationState, RoomConversationStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool get showEmoji;
  bool get isRecord;
  bool get smileOrSticker;
  int get senGiftType;
  String get smile;
   String get error;
  ConversationOldMessageModel get conversationOldMessageModel;
  RoomConversationState._();

  factory RoomConversationState([void Function(RoomConversationStateBuilder) updates]) = _$RoomConversationState;

  factory RoomConversationState.initial() {
    return RoomConversationState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..showEmoji=false
        ..isRecord=false
        ..senGiftType=0
        ..smileOrSticker=true
        ..smile=''
        ..error=''
        ..conversationOldMessageModel=
            ConversationOldMessageModel(
              data: [],
              status:false,
              error_code: 0,
              message: ''
            )

    );
  }
}


