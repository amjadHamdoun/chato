import 'package:bloc/bloc.dart';
import 'package:chato/feature/Pages/RoomPage/bloc/room_event.dart';
import 'package:chato/feature/Pages/RoomPage/bloc/room_state.dart';
import 'package:chato/feature/Pages/RoomPage/model/create_room_model.dart';
import '../api/create_room_remote.dart';






class RoomBloc extends Bloc<RoomEvent, RoomState> {
  CreateRoomRemoteDataSource createRoomRemoteDataSource;

  RoomBloc({required this.createRoomRemoteDataSource}) :
        super(RoomState.initial())
  {
    on<ChangeFilterEvent>((event, emit) =>
        emit(state.rebuild((b) => b
          ..selectedFilter=event.selectFilter
         )
        ));


    on<CreateRoomEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error=''
        ..isSuccess = false
          ..createRoomModel=CreateRoomModel(error_code: 0,
              message: '', status: null)
      ));

      final result = await
      createRoomRemoteDataSource.createRoom(
         name: event.roomName
      );

      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..error = l
          ..isLoading = false
          ..isSuccess = false
        ));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..error=''
          ..isLoading = false
          ..isSuccess = true
            ..createRoomModel=r
        ));
      });
    });


  }


  void onChangeFilter(int filter) {
    add(ChangeFilterEvent(filter));
  }

  void onCreateRoomEvent(String roomName) {
    add(CreateRoomEvent(roomName: roomName));
  }


}