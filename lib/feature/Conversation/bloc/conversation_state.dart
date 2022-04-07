



import 'package:built_value/built_value.dart';



part 'conversation_state.g.dart';


abstract class ConversationState implements Built<ConversationState, ConversationStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool get showEmoji;
  bool get isRecord;



  ConversationState._();

  factory ConversationState([void Function(ConversationStateBuilder) updates]) = _$ConversationState;

  factory ConversationState.initial() {
    return ConversationState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..showEmoji=false
        ..isRecord=false

    );
  }
}


