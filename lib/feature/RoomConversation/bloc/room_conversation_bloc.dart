import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';



import 'room_conversation_event.dart';
import 'room_conversation_state.dart';


class RoomConversationBloc extends Bloc<RoomConversationEvent, RoomConversationState> {


  RoomConversationBloc() : super(RoomConversationState.initial())
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

  }


  void onShowEmojiEvent(bool show) {
    add(ShowEmojiEvent(show));
  }

  void onStartRecord(bool show) {
    add(StartRecordEvent(show));
  }


}