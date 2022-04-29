import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:chato/feature/Pages/ProfilePage/model/countFriend/count_friend_model.dart';
import 'package:chato/feature/Pages/ProfilePage/model/profile/profile_data.dart';

import '../model/profile/profile_model.dart';


part 'prof_state.g.dart';

abstract class ProfState implements Built<ProfState, ProfStateBuilder> {
  bool? get isSuccess;

  bool? get isLoading;

  bool? get isSuccessLogout;

  bool? get isLoadingLogout;

  String? get error;

  File? get img;

  ProfileModel? get profileModel;

  CountFriendModel? get countFriendModel;

  ProfState._();

  factory ProfState([void Function(ProfStateBuilder) updates]) = _$ProfState;

  factory ProfState.initial() {
    return ProfState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingLogout = false
      ..isSuccessLogout = false
      ..error = ""
      ..img=null
      ..profileModel = ProfileModel(
        data: ProfileData(
            id: 0,
            gender: '',
            img: '',
            name: '',
            birth_date: '',
            email: '',
            token: ''),
        message: '',
        error_code: 0,
        status: false,
      )
      ..countFriendModel =
          CountFriendModel(data: 0, error_code: 0, message: '', status: false));
  }
}
