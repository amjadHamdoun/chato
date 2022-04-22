
import 'package:bloc/bloc.dart';
import '../api/change-requests-friend_remote.dart';
import '../api/friendship_requests_remote.dart';
import '../api/search-friend_remote.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  FriendshipRequestsRemoteDataSource friendshipRequestsRemoteDataSource;
  ChangeRequestsFriendRemoteDataSource changeRequestsFriendRemoteDataSource;
  SearchFriendRemoteDataSource searchFriendRemoteDataSource;
  HomeBloc({
    required this.friendshipRequestsRemoteDataSource,
    required this.changeRequestsFriendRemoteDataSource,
    required this.searchFriendRemoteDataSource
    }) : super(HomeState.initial())
  {
    on<ChangePageEvent>((event, emit) =>
        emit(state.rebuild((b) => b
      ..selectedPage=event.pageNumber
     )
    ));






    ///FriendshipRequests
    on<GetFriendshipRequestsEvent>((event, emit)
    async {
      emit(state.rebuild((b) => b
        ..isLoading=true
       ..isSuccess=false
          ..error=''

      ));
      final result=await
      friendshipRequestsRemoteDataSource.friendshipRequests();
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
          ..friendshipRequestsModel = r
        ));
      });
    });







    ///قبول رفض طلبات الصداقة
    on<ChangeRequestsFriend>((event, emit)
    async {
      emit(state.rebuild((b) => b
        ..error=''

      ));
      final result=await changeRequestsFriendRemoteDataSource.
      changeRequestsFriend(
          id: event.id,
          status: event.status);
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b

          ..error = l));
        emit(state.rebuild((b) => b

          ..error = ''));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..error=''
          ));
      });
    });



    ///بحث عن صديق
    on<GetSearchFriendEvent>((event, emit)
    async {
      emit(
          state.rebuild((b) => b
        ..error=''
          ..isLoadingSearch=true
          ..isSuccessSearch=false

      ));
      final result=await searchFriendRemoteDataSource.
      searchFriend(
          search: event.search
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingSearch=false
          ..isSuccessSearch=false
          ..error = l
        ));
        emit(state.rebuild((b) => b

          ..error = ''));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..error=''
          ..isLoadingSearch=false
          ..isSuccessSearch=true
            ..searchFriendModel=r
        ));
      });
    });
  }

  void onChangePageEvent(int pageNumber) {
    add(ChangePageEvent(pageNumber));
  }
  void onGetFriendshipRequestsEvent() {
    add(GetFriendshipRequestsEvent());
  }

  void onGetSearchFriendEvent(String search) {
    add(GetSearchFriendEvent(search: search));
  }

  void onChangeRequestsFriend(  {
    required int id, required String status}) {
    add(ChangeRequestsFriend( status: status,id: id));
  }




}