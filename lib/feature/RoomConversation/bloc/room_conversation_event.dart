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
  File? allFile;
  String message;
  int roomId;
  SendMessageEvent({
     required this.message,
     required this.roomId,
     required this.allFile
  });
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

// ignore: must_be_immutable
class ChangeRecordTimerEvent extends RoomConversationEvent
{
  int count;
  ChangeRecordTimerEvent({
    required this.count,

  });
}


// ignore: must_be_immutable
class AddRemoveFavRoomEvent extends RoomConversationEvent
{
  int roomId;
  AddRemoveFavRoomEvent({
    required this.roomId,

  });
}


// ignore: must_be_immutable
class ChangePermeationUserEvent extends RoomConversationEvent
{
  int roomId;
  int userId;
  String type;
  ChangePermeationUserEvent({
    required this.roomId,
    required this.type,
    required this.userId

  });
}

// ignore: must_be_immutable
class WantToExitEvent extends RoomConversationEvent
{
  bool wantExit;

  WantToExitEvent({
    required this.wantExit,
  });
}

// ignore: must_be_immutable
class ChangeBackgroundImageEvent extends RoomConversationEvent
{
  int? id;
  int? roomId;
  String? backgroundImage;
  ChangeBackgroundImageEvent({
     this.roomId,
    this.id,
    this.backgroundImage,
     });
}


class GetBackgroundImageEvent extends RoomConversationEvent
{

}


class GetGiftEvent extends RoomConversationEvent
{

}
// ignore: must_be_immutable
class SendGiftEvent extends RoomConversationEvent
{
  int userId;
  int roomId;
  int giftId;
  SendGiftEvent({
   required this.userId,
   required this.roomId,
   required  this.giftId,
  });
}

// ignore: must_be_immutable
class DeleteUserEvent extends RoomConversationEvent
{
  int userId;
  int roomId;

  DeleteUserEvent({
    required this.userId,
    required this.roomId,

  });
}

// ignore: must_be_immutable
class BlockUserEvent extends RoomConversationEvent
{
  int userId;
  int roomId;

  BlockUserEvent({
    required this.userId,
    required this.roomId,

  });
}

// ignore: must_be_immutable
class AddTrendEvent extends RoomConversationEvent
{
  String payment;
  int roomId;

  AddTrendEvent({
    required this.payment,
    required this.roomId,

  });
}


// ignore: must_be_immutable
class ChangeRocketEvent extends RoomConversationEvent
{
  String userName;
  bool showRocket;

  ChangeRocketEvent({
    required this.userName,
    required this.showRocket,

  });
}