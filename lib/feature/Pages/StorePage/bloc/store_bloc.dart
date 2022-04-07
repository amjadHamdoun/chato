import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';



import 'store_event.dart';
import 'store_state.dart';


class StoreBloc extends Bloc<StoreEvent, StoreState> {


  StoreBloc() : super(StoreState.initial())
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