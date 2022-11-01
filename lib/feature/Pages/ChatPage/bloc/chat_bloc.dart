import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../api/get_conversation_private_remote.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  GetConversationPrivateDataSource getConversationPrivateDataSource;

  ChatBloc({required this.getConversationPrivateDataSource})
      : super(ChatState.initial()) {
    on<GetConversationPrivate>((event, emit) async {
      emit(state.rebuild((b) => b
        ..error = ''
        ..isLoadingGet = true
        ..isSuccessGet = false));
      final result =
          await getConversationPrivateDataSource.getConversationPrivate();
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingGet = false
          ..isSuccessGet = false
          ..error = l));
        emit(state.rebuild((b) => b..error = ''));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..error = ''
          ..isLoadingGet = false
          ..getConversationPrivateModel = r
          ..isSuccessGet = true));
      });
    });
  }

  void onGetConversationPrivate() {
    add(GetConversationPrivate());
  }

  String myFormatDate(String date) {
    DateTime _date = DateTime.parse(date);
    if (DateTime.now().day != _date.day) {
      final formatDate = DateFormat('yyyy-MM-dd  hh:mm a', 'en');
      return formatDate.format(_date).toString();
    } else {
      final formatDate = DateFormat('hh:mm a', 'en');
      return formatDate.format(_date).toString();
    }
  }
}
