import 'package:bloc/bloc.dart';
import 'package:chato/Globals.dart';
import 'package:chato/Preference.dart';
import 'package:chato/feature/Pages/ProfilePage/api/count_friend_remote.dart';
import 'package:chato/feature/Pages/ProfilePage/api/profile_remote.dart';
import 'package:chato/feature/Pages/ProfilePage/model/count_friend_model.dart';
import 'package:chato/feature/Pages/ProfilePage/model/profile_data.dart';
import 'package:chato/feature/Pages/ProfilePage/model/profile_model.dart';
import 'package:chato/feature/autho/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/logout_remote.dart';
import '../model/logout_model.dart';
import 'prof_event.dart';
import 'prof_state.dart';

class ProfBloc extends Bloc<ProfEvent, ProfState> {
  LogoutRemoteDataSource logoutRemoteDataSource;
  ProfileDetailsRemoteDataSource profileDetailsRemoteDataSource;
 CountFriendDetailsRemoteDataSource countFriendDetailsRemoteDataSource;
  ProfBloc(
      {required this.profileDetailsRemoteDataSource,
      required this.logoutRemoteDataSource,
      required this.countFriendDetailsRemoteDataSource
      })
      : super(ProfState.initial()) {
    on<LogoutEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccessLogout = false
        ..isLoadingLogout = true));
      final result = await logoutRemoteDataSource.logout();
      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccessLogout = false
          ..isLoadingLogout = false));
      }, (r) async {
        print('r');
        if (r.message != null) {
          Preferences.saveUserToken('');
          Global.userToken = '';
        }
        emit(state.rebuild((b) => b
          ..isSuccessLogout = true
          ..isLoadingLogout = false));
      });
    });
    on<getProfileDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..profileModel = ProfileModel(
            data: ProfileData(id: 0, email: '', birth_date: '', img: '', gender: '', name: '', token: '',),
            message: '',
            error_code: 0,
            status: false)));
      final result = await profileDetailsRemoteDataSource.profileDetails(
      );
      print("result");
      print(result);
      print("result");

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
          ..profileModel = r));
      });

    });
    on<getCountFriendEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..countFriendModel =CountFriendModel(data: 0, error_code: 0, message: '', status: false) ));

      final result = await countFriendDetailsRemoteDataSource.countFriendDetails();

      print("result");
      print(result);
      print("result");

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
          ..countFriendModel = r));
      });

    });

  }

  void onLogoutEvent() {
    add(LogoutEvent());
  }

  void onGetProfileDetailsEvent() {
    add(getProfileDetailsEvent());
  }
  void onGetCountFriendEvent(){
    add(getCountFriendEvent());

  }
}
