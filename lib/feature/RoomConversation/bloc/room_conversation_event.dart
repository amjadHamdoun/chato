import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
