import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangePageEvent extends HomeEvent{
   int pageNumber;
   ChangePageEvent(this.pageNumber);
}


class GetFriendshipRequestsEvent extends HomeEvent{

}


