
import 'package:bloc/bloc.dart';
import '../../Pages/ChatPage/api/get_conversation_private_remote.dart';
import '../../RoomConversation/api/get_conversation_old_message_remote.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';


class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationOldMessageDataSource conversationOldMessageDataSource;


  ConversationBloc({
    required this.conversationOldMessageDataSource
     }) : super(ConversationState.initial())
  {
    on<ShowEmojiEvent>((event, emit) =>
        emit(state.rebuild((b) => b
      ..showEmoji=event.show
     )
    ));
    on<StartRecordEvent>((event, emit) =>
        emit(state.rebuild((b) => b
          ..isRecord=event.isRecord
        )
        ));



  }


  void onShowEmojiEvent(bool show) {
    add(ShowEmojiEvent(show));
  }

  void onStartRecord(bool show) {
    add(StartRecordEvent(show));
  }
  void onGetConversationMessage(int id) {
    add(GetConversationMessage( id: id));
  }




}