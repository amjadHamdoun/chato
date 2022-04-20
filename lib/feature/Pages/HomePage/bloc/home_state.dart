



import 'package:built_value/built_value.dart';

import '../model/friendship_requests_model.dart';



part 'home_state.g.dart';


abstract class HomeState implements Built<HomeState, HomeStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String get error;
  int get selectedPage;
  FriendshipRequestsModel get friendshipRequestsModel;


  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) =
  _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..isLoading = false
      ..isSuccess = false
        ..selectedPage=0
        ..error=''
        ..friendshipRequestsModel=
        FriendshipRequestsModel(
          status: false,
          error_code: 0,
          message: '',
          data: []
        )

    );
  }
}


