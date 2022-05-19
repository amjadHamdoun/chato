import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chato/Globals.dart';

import 'package:chato/feature/User/model/user_data.dart';
import 'package:profanity_filter/profanity_filter.dart';

import '../../../core/utils/int_to_time.dart';
import '../../../injection.dart';

import '../api/add_user_remote.dart';
import '../api/get_all_type_message_remote.dart';
import '../api/get_conversation_old_message_remote.dart';
import '../api/send_message_remote.dart';
import '../model/conversationMessage/conversation_old_message_data_model.dart';
import '../model/conversationMessage/conversation_old_message_model.dart';
import 'room_conversation_event.dart';
import 'room_conversation_state.dart';

class RoomConversationBloc
    extends Bloc<RoomConversationEvent,
        RoomConversationState> {
  ConversationOldMessageDataSource conversationOldMessageDataSource;
  AllTypeDataSource allTypeDataSource;
  SendMessageDataSource sendMessageDataSource;
  AddUserDataSource addUserDataSource;

  RoomConversationBloc({
    required this.conversationOldMessageDataSource,
    required this.allTypeDataSource,
    required this.sendMessageDataSource,
    required this.addUserDataSource
   }) : super(
      RoomConversationState.initial()) {

    on<ShowEmojiEvent>(
        (event, emit) => emit(state.rebuild((b) =>
        b..showEmoji = event.show)));

    on<ChangeRecordTimerEvent>(
            (event, emit) => emit(state.rebuild((b) =>
        b..recordTime = intToTimeLeft(event.count))));

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

    on<AddMessageFromPusherEvent>((event, emit) {
      ConversationOldMessageModel messageModel=
      ConversationOldMessageModel(data: [],
      status: false,
        error_code: 0,
        message: ''
      );
      for(var message in state.conversationOldMessageModel.data!)
        {
          messageModel.data!.add(message);

        }
      messageModel.data!.add(event.message);
      emit(state.rebuild((b) =>
             b..conversationOldMessageModel=
                 messageModel  ));
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
          ConversationOldMessageModel data=
          ConversationOldMessageModel(status: false,
          message: '',
            error_code: 0,
            data: []
          );
          for(int i=0;i<r.data!.length;i++){
            data.data!.add(r.data![r.data!.length-i-1]);
          }
          emit(state.rebuild((b) => b
            ..error=''
            ..isLoading=false

            ..conversationOldMessageModel=data
            ..isSuccess=true
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
               ..allTypeUser=r
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
         else if(event.type=='admin') {
           emit(state.rebuild((b) => b
             ..error=''
             ..isLoadingAllType=false
             ..isSuccessAllType=true
             ..allTypeAdmin=r
           ));
         }
         else  {
           emit(state.rebuild((b) => b
             ..error=''
             ..isLoadingAllType=false
             ..isSuccessAllType=true
             ..allTypeModel=r
           ));
         }

      });
    });

    on<SendMessageEvent>((event, emit)
    async {
      final filter =sl<ProfanityFilter> ();


      String cleanString = filter.censor(event.message);

      emit(
          state.rebuild((b) => b
            ..error=''
              ..conversationOldMessageModel!.data!.add(
                  ConversationOldMessageDataModel(
                    id: 0,
                    message: cleanString,
                    localFile: event.allFile!=null?event.allFile!.path:
                      '',
                    conversation_id: '0',
                    seen: '',
                    created_at: '',
                    updated_at: '',
                    user: UserData(
                      id: Global.userId,
                      name: Global.userName,
                      email: '',
                      img: Global.userImage,
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
          message: cleanString,
          roomId: event.roomId,
        file: event.allFile
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
    on<AddUserRoomEvent>((event, emit)
    async {
      emit(
          state.rebuild((b) => b
            ..error=''

          ));
      final result=await
      addUserDataSource.
      addUser(
          userId: event.user_id,
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

  void onSendMessageEvent(String message,int roomId,
      File? file) {
    add(SendMessageEvent(message: message,roomId: roomId,
        allFile: file));
  }

  void onAddUserRoomEvent(int userId,int roomId) {
    add(AddUserRoomEvent(user_id: userId,roomId: roomId));
  }
    void onAddMessageFromPusherEvent(
        ConversationOldMessageDataModel message) {
      add(AddMessageFromPusherEvent(message: message));
    }

  void onChangeRecordTimerEvent(
      int counter) {
    add(ChangeRecordTimerEvent(count: counter));
  }

}
