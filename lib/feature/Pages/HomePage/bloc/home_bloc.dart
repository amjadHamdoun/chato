import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';



import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {


  HomeBloc() : super(HomeState.initial())
  {
    on<ChangePageEvent>((event, emit) =>
        emit(state.rebuild((b) => b
      ..selectedPage=event.pageNumber
     )
    ));
  }

  void onChangePageEvent(int pageNumber) {
    add(ChangePageEvent(pageNumber));
  }




}