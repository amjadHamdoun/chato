import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chato/Preference.dart';
import 'package:chato/feature/User/api/add_friend_remote.dart';
import 'package:chato/feature/User/api/user_remote.dart';
import 'package:chato/feature/User/bloc/user_event.dart';
import 'package:chato/feature/User/bloc/user_state.dart';
import 'package:chato/feature/User/model/add_friend_data.dart';
import 'package:chato/feature/User/model/add_friend_model.dart';
import 'package:chato/feature/User/model/user_data.dart';
import 'package:chato/feature/User/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserDetailsRemoteDataSource userRemoteDataSource;
  AddFriendRemoteDataSource addFriendRemoteDataSource;

  UserBloc({
    required this.userRemoteDataSource,
    required this.addFriendRemoteDataSource
  }) : super(UserState.initial()) {
    on<GetUserDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..userModel = UserModel(
            data: UserData(
              id: 0,
              email: '',
              birth_date: '',
              img: '',
              gender: '',
              name: '',
              token: '',
            ),
            message: '',
            error_code: 0,
            status: false)));
      final result = await userRemoteDataSource.
      userDetails(id: event.id);


      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..isSuccess = true
          ..isLoading = false
          ..userModel = r));
      });
    });

    on<AddFriendEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..addFriend = true
        ..addFriendModel = AddFriendModel(
            data: AddFriendData(
              id: 0, friend_id: 0, user_id: 0, status: '',
            ),
            message: '',
            error_code: 0,
            status: false)));
      final result = await addFriendRemoteDataSource.addFriend();
      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..addFriend = false
          ..error = l));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..isSuccess = true
          ..isLoading = false
          ..addFriend = true
          ..addFriendModel = r));
      });
    });
  }

  void onGetDetailsUserEvent(int id) {
    add(GetUserDetailsEvent(id: id));
  }

  void onAddFriendEvent() {
    add(AddFriendEvent());
  }
}
