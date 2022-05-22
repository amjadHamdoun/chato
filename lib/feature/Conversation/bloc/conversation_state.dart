import 'package:built_value/built_value.dart';
import '../../Pages/ChatPage/model/get_conversation_privet_model.dart';
import '../model/private_old_message_model.dart';
part 'conversation_state.g.dart';


abstract class ConversationState implements
    Built<ConversationState, ConversationStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessGet;
  bool? get isLoadingGet;
  bool get showEmoji;
  bool get isRecord;
  PrivateOldMessageModel get privateOldMessageModel;
  String get error;

  ConversationState._();

  factory ConversationState([void Function(ConversationStateBuilder) updates]) = _$ConversationState;

  factory ConversationState.initial() {
    return ConversationState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingGet = false
      ..isSuccessGet = false
        ..showEmoji=false
        ..isRecord=false
        ..privateOldMessageModel=
        PrivateOldMessageModel(
            status: false,
               message: '',
              error_code: 0,
              data: []
            )


        ..error=''

    );
  }
}


