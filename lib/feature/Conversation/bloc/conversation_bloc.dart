import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:profanity_filter/profanity_filter.dart';
import '../../../Globals.dart';
import '../../../core/utils/int_to_time.dart';
import '../../../injection.dart';
import '../../RoomConversation/api/send_message_remote.dart';
import '../../User/model/user_data.dart';
import '../api/block_user_remote.dart';
import '../api/get_conversation_old_message_remote.dart';
import '../model/private_old_message_data_model.dart';
import '../model/private_old_message_model.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';


class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  PrivateOldMessageDataSource privateOldMessageDataSource;
  SendMessageDataSource sendMessageDataSource;
  BlockUserRemoteDataSource blockUserRemoteDataSource;
  ConversationBloc({
    required this.privateOldMessageDataSource,
    required this.sendMessageDataSource,
    required this.blockUserRemoteDataSource
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

    on<ChangeRecordTimerEvent>(
            (event, emit) => emit(state.rebuild((b) =>
        b..recordTime = intToTimeLeft(event.count))));



    on<GetConversationMessage>((event, emit)
    async {
      emit(
          state.rebuild((b) => b
            ..error=''
            ..isLoading=true
            ..isSuccess=false
            ..privateOldMessageModel=
            PrivateOldMessageModel(
                message: '',
                error_code: 0,
                status: false,
                data: []
            )
          ));
      final result=await
      privateOldMessageDataSource.
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
        PrivateOldMessageModel data=
        PrivateOldMessageModel(status: false,
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
          ..privateOldMessageModel=data
          ..isSuccess=true
        ));
      });
    });


    on<BlockUserEvent>((event, emit)
    async {
      emit(
          state.rebuild((b) => b
            ..error=''
            ..isLoadingBloc=true
            ..isSuccessBloc=false
            ..blocUser=''
          ));
      final result=await
      blockUserRemoteDataSource.blockUser(
        blockedId: event.userId
      );

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingBloc=false
          ..isSuccessBloc=false
          ..error = l
        ));
        emit(state.rebuild((b) => b
          ..error = ''));
      }, (r) async {

        emit(state.rebuild((b) => b
          ..error=''
          ..isLoadingBloc=false
          ..blocUser=r
          ..isSuccessBloc=true
        ));
        emit(state.rebuild((b) => b

          ..blocUser=''
          ..isSuccessBloc=false
        ));
      });
    });


    on<AddMessageFromPusherEvent>((event, emit) {
      PrivateOldMessageModel messageModel=
      PrivateOldMessageModel(data: [],
          status: false,
          error_code: 0,
          message: ''
      );
      for(var message in state.privateOldMessageModel.data!)
      {
        messageModel.data!.add(message);

      }
      messageModel.data!.add(event.message);
      emit(state.rebuild((b) =>
      b..privateOldMessageModel=
          messageModel  ));
    });


    on<SendMessageEvent>((event, emit)
    async {
      final filter =sl<ProfanityFilter> ();


      String cleanString = filter.censor(event.message);




      emit(
          state.rebuild((b) => b
            ..error=''
            ..privateOldMessageModel!.data!.add(
                PrivateOldMessageDataModel(
                    id: 0,
                    message: cleanString,
                    localFile: event.allFile!=null?event.allFile!.path:
                    '',
                    conversation_id: '0',
                    seen: '',
                    created_at: '',
                    updated_at: '',
                    all_file: null,
                    user: UserData(
                        id: Global.userId,
                        name: Global.userName,
                        email: '',
                        img: Global.userImage,
                        token: Global.userToken,
                        birth_date: '',
                        gender: ''
                    ),
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



  }


  void onShowEmojiEvent(bool show) {
    add(ShowEmojiEvent(show));
  }
  void onStartRecord(bool show) {
    add(StartRecordEvent(show));
  }
  void onGetConversationMessage(String id) {
    add(GetConversationMessage( id: id));
  }
  void onAddMessageFromPusherEvent(PrivateOldMessageDataModel message) {
    add(AddMessageFromPusherEvent(message:message ));
  }
  void onSendMessageEvent(String message,int roomId,
      File? file) {
    add(SendMessageEvent(message: message,roomId: roomId,
        allFile: file));
  }
  void onChangeRecordTimerEvent(
      int counter) {
    add(ChangeRecordTimerEvent(count: counter));
  }
  void onBlockUserEvent(
      int userId) {
    add(BlockUserEvent(userId:userId ));
  }



}