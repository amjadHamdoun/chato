import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../Conversation/model/private_old_message_data_model.dart';
import '../model/conversationMessage/conversation_old_message_data_model.dart';

@immutable
abstract class RoomConversationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ShowEmojiEvent extends RoomConversationEvent{
   bool show;
   ShowEmojiEvent(this.show);
}
// ignore: must_be_immutable
class StartRecordEvent extends RoomConversationEvent{
  bool isRecord;
  StartRecordEvent(this.isRecord);
}
// ignore: must_be_immutable
class ChangeGiftEvent extends RoomConversationEvent{
  int type;
  ChangeGiftEvent(this.type);
}

// ignore: must_be_immutable
class AddSmileEvent extends RoomConversationEvent{
  String smile;
  AddSmileEvent({required this.smile});
}

// ignore: must_be_immutable
class SwitchSmileStickerEvent extends RoomConversationEvent{
  bool smile;
  SwitchSmileStickerEvent({required this.smile});
}

// ignore: must_be_immutable
class GetConversationMessage extends RoomConversationEvent
{
  int id;
  GetConversationMessage({required this.id});
}

// ignore: must_be_immutable
class GetAllTypeEvent extends RoomConversationEvent
{
  String type;
  int roomId;
  GetAllTypeEvent({required this.type,required this.roomId});
}

// ignore: must_be_immutable
class SendMessageEvent extends RoomConversationEvent
{
  String message;
  int roomId;
  SendMessageEvent({
     required this.message,
     required this.roomId});
}

// ignore: must_be_immutable
class AddUserRoomEvent extends RoomConversationEvent
{
  int user_id;
  int roomId;
  AddUserRoomEvent({
    required this.user_id,
    required this.roomId
  });
}

// ignore: must_be_immutable
class AddMessageFromPusherEvent extends RoomConversationEvent
{
  ConversationOldMessageDataModel message;
  AddMessageFromPusherEvent({
    required this.message,

  });
}