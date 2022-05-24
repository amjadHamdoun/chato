import 'package:built_value/built_value.dart';

import '../../Conversation/model/private_old_message_model.dart';
import '../model/allType/all_type_model.dart';
import '../model/changePermeationUser/change_permeation_user_model.dart';
import '../model/conversationMessage/conversation_old_message_model.dart';
import '../model/sendMessage/send_message_model.dart';



part 'room_conversation_state.g.dart';


abstract class RoomConversationState implements Built<RoomConversationState, RoomConversationStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;

  bool? get isSuccessAllType;
  bool? get isLoadingAllType;

  bool? get isSuccessChangePer;
  bool? get isLoadingChangePer;

  bool get showEmoji;
  bool get isRecord;
  bool get smileOrSticker;
  int get senGiftType;
  String get smile;
   String get error;
  ConversationOldMessageModel get conversationOldMessageModel;
  AllTypeModel get allTypeUser;
  AllTypeModel get allTypeModel;
  AllTypeModel get allTypeOwner;
  AllTypeModel get allTypeAdmin;
  SendMessageModel get sendMessageModel;
  String get recordTime;
  ChangePermeationModel get changePermeationModel;


  RoomConversationState._();

  factory RoomConversationState([void Function(RoomConversationStateBuilder) updates]) = _$RoomConversationState;

  factory RoomConversationState.initial() {
    return RoomConversationState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingAllType = false
      ..isSuccessAllType = false
      ..isLoadingChangePer=false
      ..isSuccessChangePer=false
        ..showEmoji=false
        ..isRecord=false
        ..senGiftType=0
        ..smileOrSticker=true
        ..smile=''
        ..error=''
      ..recordTime='00:00'
      ..changePermeationModel=ChangePermeationModel(
        error_code: 0,
        message: '',
        status: false

      )
      ..sendMessageModel=SendMessageModel(message: '',
          status: null,
        error_code: 0
      )
        ..conversationOldMessageModel= ConversationOldMessageModel(
              data: [],
              status:false,
              error_code: 0,
              message: ''
            )
        ..allTypeModel=AllTypeModel(data: [],
            error_code: 0, message: '', status: false)
        ..allTypeOwner=AllTypeModel(data: [],
          error_code: 0, message: '', status: false)
        ..allTypeAdmin=AllTypeModel(data: [],
          error_code: 0, message: '', status: false)
         ..allTypeUser=AllTypeModel(data: [],
             error_code: 0, message: '', status: false)
    );
  }
}


