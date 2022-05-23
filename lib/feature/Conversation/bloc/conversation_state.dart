import 'package:built_value/built_value.dart';
import '../../Pages/ChatPage/model/get_conversation_privet_model.dart';
import '../../RoomConversation/model/sendMessage/send_message_model.dart';
import '../model/private_old_message_model.dart';
part 'conversation_state.g.dart';


abstract class ConversationState implements
    Built<ConversationState, ConversationStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessBloc;
  bool? get isLoadingBloc;
  bool get showEmoji;
  bool get isRecord;
  PrivateOldMessageModel get privateOldMessageModel;
  String get error;
  SendMessageModel get sendMessageModel;
  String get smile;
  String get recordTime;
  String get blocUser;

  ConversationState._();

  factory ConversationState([void Function(ConversationStateBuilder) updates]) = _$ConversationState;

  factory ConversationState.initial() {
    return ConversationState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingBloc = false
      ..isSuccessBloc = false
      ..showEmoji=false
      ..blocUser=''
      ..recordTime='00:00'
      ..isRecord=false
      ..smile=''
         ..sendMessageModel=SendMessageModel(
           status: false,
            message: '',
           error_code: 0
         )
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


