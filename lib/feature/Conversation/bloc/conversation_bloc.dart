
import 'package:bloc/bloc.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';


class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {


  ConversationBloc() : super(ConversationState.initial())
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