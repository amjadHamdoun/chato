import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chato/Globals.dart';
import 'package:chato/Preference.dart';
import 'package:chato/feature/Pages/ProfilePage/api/count_friend_remote.dart';
import 'package:chato/feature/Pages/ProfilePage/api/profile_remote.dart';
import 'package:chato/feature/Pages/ProfilePage/model/count_friend_model.dart';
import 'package:chato/feature/Pages/ProfilePage/model/profile_data.dart';
import 'package:chato/feature/Pages/ProfilePage/model/profile_model.dart';

import '../api/logout_remote.dart';

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
    on<GetProfileDetailsEvent>((event, emit) async {
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
    on<GetCountFriendEvent>((event, emit) async {
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





    on<ChangeImageEvent>((event, emit) async {
      emit(state.rebuild((b) => b
       ..img=event.image
      ));





    });

  }

  void onLogoutEvent() {
    add(LogoutEvent());
  }

  void onChangeImageEvent(File image) {
    add(ChangeImageEvent(image: image));
  }
  void onGetProfileDetailsEvent() {
    add(GetProfileDetailsEvent());
  }
  void onGetCountFriendEvent(){
    add(GetCountFriendEvent());

  }
}
