import 'package:bloc/bloc.dart';
import '../api/get_conversation_old_message_remote.dart';
import '../model/private_old_message_model.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';


class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  PrivateOldMessageDataSource privateOldMessageDataSource;


  ConversationBloc({
    required this.privateOldMessageDataSource
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




}