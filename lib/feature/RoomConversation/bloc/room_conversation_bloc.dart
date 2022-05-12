import 'package:bloc/bloc.dart';
import '../api/get_conversation_old_message_remote.dart';
import 'room_conversation_event.dart';
import 'room_conversation_state.dart';

class RoomConversationBloc
    extends Bloc<RoomConversationEvent,
        RoomConversationState> {
  ConversationOldMessageDataSource
   conversationOldMessageDataSource;
  RoomConversationBloc({
    required this.conversationOldMessageDataSource
   }) : super(
      RoomConversationState.initial()) {

    on<ShowEmojiEvent>(
        (event, emit) => emit(state.rebuild((b) =>
        b..showEmoji = event.show)));

    on<StartRecordEvent>((event, emit) =>
        emit(state.rebuild((b) => b..isRecord =
            event.isRecord)));

    on<ChangeGiftEvent>((event, emit) =>
        emit(state.rebuild((b) => b..senGiftType =
            event.type)));

    on<AddSmileEvent>((event, emit) {
      emit(state.rebuild((b) =>
          b..smile = event.smile));
      emit(state.rebuild((b) =>
         b..smile = ''  ));
    });

      on<SwitchSmileStickerEvent>((event, emit) {
        emit(state.rebuild((b) =>
            b..smileOrSticker = event.smile
        ));
      });



      on<GetConversationMessage>((event, emit)
      async {
        emit(
            state.rebuild((b) => b
              ..error=''
              ..isLoading=true
              ..isSuccess=false

            ));
        final result=await
        conversationOldMessageDataSource.
        getConversationOldMessage(
          conversationId: event.id
        );
        return result.fold((l) async {
          print('l');
          emit(state.rebuild((b) => b
            ..isLoading=false
            ..isSuccess=false
            ..error = l
          ));
          emit(state.rebuild((b) => b

            ..error = ''));
        }, (r) async {
          print('r');

          emit(state.rebuild((b) => b
            ..error=''
            ..isLoading=false
            ..isSuccess=true
            ..conversationOldMessageModel=r
          ));
        });
      });















  }

  void onShowEmojiEvent(bool show) {
    add(ShowEmojiEvent(show));
  }

  void onStartRecord(bool show) {
    add(StartRecordEvent(show));
  }

  void onChangeGiftEvent(int type) {
    add(ChangeGiftEvent(type));
  }

  void onAddSmileEvent(String smile) {
    add(AddSmileEvent(smile: smile));
  }

  void onSwitchSmileStickerEvent(bool smile) {
    add(SwitchSmileStickerEvent(smile: smile));
  }

  void onGetConversationMessage(int id) {
    add(GetConversationMessage(id: id));
  }


}
