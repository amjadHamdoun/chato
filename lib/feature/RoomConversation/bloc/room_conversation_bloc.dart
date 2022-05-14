import 'package:bloc/bloc.dart';
import 'package:chato/Globals.dart';
import 'package:chato/feature/Pages/RoomPage/model/favModel/fav_room_data_model.dart';
import 'package:chato/feature/User/model/user_data.dart';

import '../../Conversation/model/conversation_old_message_data_model.dart';
import '../../Conversation/model/conversation_old_message_model.dart';
import '../api/get_all_type_message_remote.dart';
import '../api/get_conversation_old_message_remote.dart';
import '../api/send_message_remote.dart';
import 'room_conversation_event.dart';
import 'room_conversation_state.dart';

class RoomConversationBloc
    extends Bloc<RoomConversationEvent,
        RoomConversationState> {
  ConversationOldMessageDataSource conversationOldMessageDataSource;
  AllTypeDataSource allTypeDataSource;
  SendMessageDataSource sendMessageDataSource;
  RoomConversationBloc({
    required this.conversationOldMessageDataSource,
    required this.allTypeDataSource,
    required this.sendMessageDataSource
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
     ..conversationOldMessageModel=
         ConversationOldMessageModel(
           message: '',
           error_code: 0,
           status: false,
           data: []
         )
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


    on<GetAllTypeEvent>((event, emit)
    async {
      emit(
          state.rebuild((b) => b
            ..error=''
              ..isLoadingAllType=true
            ..isSuccessAllType=false
          ));
      final result=await
      allTypeDataSource.
      getAllType(
          type: event.type,
        roomId: event.roomId
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingAllType=false
          ..isSuccessAllType=false
          ..error = l
        ));
        emit(state.rebuild((b) => b

          ..error = ''));
      }, (r) async {
        print('r');
         if(event.type=='user')
           {
             emit(state.rebuild((b) => b
               ..error=''
               ..isLoadingAllType=false
               ..isSuccessAllType=true
               ..allTypeModel=r
             ));
           }
         else if(event.type=='owner'){
           emit(state.rebuild((b) => b
             ..error=''
             ..isLoadingAllType=false
             ..isSuccessAllType=true
             ..allTypeOwner=r
           ));
         }
         else  {
           emit(state.rebuild((b) => b
             ..error=''
             ..isLoadingAllType=false
             ..isSuccessAllType=true
             ..allTypeAdmin=r
           ));
         }

      });
    });

    on<SendMessageEvent>((event, emit)
    async {
      emit(
          state.rebuild((b) => b
            ..error=''
              ..conversationOldMessageModel!.data!.add(
                  ConversationOldMessageDataModel(
                    message: event.message,
                    id: 0,
                    conversation_id: '0',
                    seen: '',
                    created_at: '',
                    updated_at: '',
                    user: UserData(
                      id: Global.userId,
                      name: '',
                      email: '',
                      img: '',
                      token: Global.userToken,
                      birth_date: '',
                      gender: ''
                    )
                  )
              )
          ));
      final result=await
      sendMessageDataSource.
      sendMessage(
          message: event.message,
          roomId: event.roomId
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b

          ..error = l
        ));
        emit(state.rebuild((b) => b

          ..error = ''));
      }, (r) async {
        print('r');

          emit(state.rebuild((b) => b
            ..error=''

            ..sendMessageModel=r
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
  void onGetAllTypeEvent(String type,int roomId) {
    add(GetAllTypeEvent(type: type,roomId: roomId));
  }
  void onSendMessageEvent(String message,int roomId) {
    add(SendMessageEvent(message: message,roomId: roomId));
  }

}
