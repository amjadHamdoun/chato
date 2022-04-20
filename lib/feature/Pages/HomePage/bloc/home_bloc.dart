
import 'package:bloc/bloc.dart';
import '../api/friendship_requests_remote.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  FriendshipRequestsRemoteDataSource friendshipRequestsRemoteDataSource;

  HomeBloc({
    required this.friendshipRequestsRemoteDataSource,
    }) : super(HomeState.initial())
  {
    on<ChangePageEvent>((event, emit) =>
        emit(state.rebuild((b) => b
      ..selectedPage=event.pageNumber
     )
    ));


    on<GetFriendshipRequestsEvent>((event, emit)
    async {
      emit(state.rebuild((b) => b
        ..isLoading=true
       ..isSuccess=false
          ..error=''

      ));
      final result=await friendshipRequestsRemoteDataSource.friendshipRequests();
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
        emit(state.rebuild((b) => b

          ..error = ''));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..isSuccess = true
          ..isLoading = false
          ..error=''
          ..friendshipRequestsModel = r));
      });
    });
  }

  void onChangePageEvent(int pageNumber) {
    add(ChangePageEvent(pageNumber));
  }
  void onGetFriendshipRequestsEvent() {
    add(GetFriendshipRequestsEvent());
  }




}