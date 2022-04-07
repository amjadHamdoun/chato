
import 'package:bloc/bloc.dart';
import 'package:chato/feature/Pages/RoomPage/bloc/room_event.dart';
import 'package:chato/feature/Pages/RoomPage/bloc/room_state.dart';






class RoomBloc extends Bloc<RoomEvent, RoomState> {


  RoomBloc() : super(RoomState.initial())
  {
    on<ChangeFilterEvent>((event, emit) =>
        emit(state.rebuild((b) => b
          ..selectedFilter=event.selectFilter
        )
        ));


  }


  void onChangeFilter(int filter) {
    add(ChangeFilterEvent(filter));
  }



}