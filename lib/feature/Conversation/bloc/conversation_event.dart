import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConversationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ShowEmojiEvent extends ConversationEvent{
   bool show;
   ShowEmojiEvent(this.show);
}
// ignore: must_be_immutable
class StartRecordEvent extends ConversationEvent{
  bool isRecord;
  StartRecordEvent(this.isRecord);
}
// ignore: must_be_immutable
class GetConversationMessage extends ConversationEvent
{
  int id;
  GetConversationMessage({required this.id});
}
