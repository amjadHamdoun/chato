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