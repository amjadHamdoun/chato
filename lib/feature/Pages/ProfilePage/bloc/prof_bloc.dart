import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chato/Globals.dart';
import 'package:chato/Preference.dart';
import 'package:chato/feature/Pages/ProfilePage/api/count_friend_remote.dart';
import 'package:chato/feature/Pages/ProfilePage/api/profile_remote.dart';
import 'package:chato/feature/Pages/ProfilePage/model/blockedUser/blocked_user_model.dart';
import 'package:chato/feature/Pages/ProfilePage/model/countFriend/count_friend_model.dart';
import 'package:chato/feature/Pages/ProfilePage/model/profile/profile_data.dart';
import '../api/blocked_user_remote.dart';
import '../api/logout_remote.dart';
import '../api/unblocked_user_remote.dart';
import '../api/update_user_info_remote.dart';
import '../model/profile/profile_model.dart';
import 'prof_event.dart';
import 'prof_state.dart';

class ProfBloc extends Bloc<ProfEvent, ProfState> {
  UpdateUserInfoDataSource updateUserInfoDataSource;
  LogoutRemoteDataSource logoutRemoteDataSource;
  ProfileDetailsRemoteDataSource profileDetailsRemoteDataSource;
 CountFriendDetailsRemoteDataSource countFriendDetailsRemoteDataSource;
  BlockedUserRemoteDataSource blockedUserRemoteDataSource;
  UnBlockedUserRemoteDataSource unBlockedUserRemoteDataSource;

  ProfBloc(
      {required this.profileDetailsRemoteDataSource,
      required this.logoutRemoteDataSource,
      required this.countFriendDetailsRemoteDataSource,
        required this.updateUserInfoDataSource,
        required this.blockedUserRemoteDataSource,
        required this.unBlockedUserRemoteDataSource
      })
      : super(ProfState.initial()) {
    on<LogoutEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccessLogout = false
        ..isLoadingLogout = true));
      final result = await logoutRemoteDataSource.logout();


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


    //GetCountFriendEvent
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

      final result = await
      updateUserInfoDataSource.updateUser(
        img: event.image
      );

      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b

          ..error = l));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..error=''));
      });






    });


    on<GetBlockedUserEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading=true
          ..isSuccess=false
          ..error=''
          ..blockedUserModel=BlockedUserModel(
              data: [],
              error_code: 0,
              message: '',
              status: false)
      ));

      final result = await
      blockedUserRemoteDataSource.getBlockedUser(

      );

      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading=false
          ..isSuccess=false
          ..error = l));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..error=''
          ..isLoading=false
          ..isSuccess=true
            ..blockedUserModel=r
        ));
      });






    });

    on<UnBlockedUserEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..error=''
      ));

      final result = await
      unBlockedUserRemoteDataSource.unBlockedUser(
        blockedId:event.blockedId
      );

      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..error = l
        ));
      }, (r) async {
        print('r');

        emit(state.rebuild((b) => b
          ..error=''
        ));
      });






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

  void onGetBlockedUserEvent(){
    add(GetBlockedUserEvent());
  }

  void onUnBlockedUserEvent(int blockedId){
    add(UnBlockedUserEvent(blockedId: blockedId));
  }

}
