import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chato/Preference.dart';
import 'package:flutter/cupertino.dart';

import '../../../../Globals.dart';
import '../api/login_remote.dart';
import '../model/login_data_model.dart';
import '../model/login_model.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginBloc({
    required this.loginRemoteDataSource,
  }) : super(LoginState.initial()) {
    on<LoginAccountEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..loginModel = LoginModel(
            data: LoginDataModel(email: '', name: '', id: 0, token: ''),
            message: '',
            error_code: 0,
            status: false)));
      final result = await loginRemoteDataSource.login(
        name: event.name,
        password: event.password,
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
        if (r.data != null) {
          if (r.data!.token != null) {
            Global.userToken=r.data!.token!;
            Preferences.saveUserToken(r.data!.token!);
          }
        }

        emit(state.rebuild((b) => b
          ..isSuccess = true
          ..isLoading = false
          ..loginModel = r));
      });
    });
  }

  void onLoginAccountEvent({
    required String name,
    required String password,
  }) {
    add(LoginAccountEvent(
      name: name,
      password: password,
    ));
  }
}
