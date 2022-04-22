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
// ignore: must_be_immutable
class GetSearchFriendEvent extends HomeEvent{
  String search;
  GetSearchFriendEvent({
    required this.search,
   });
}

// ignore: must_be_immutable
class ChangeRequestsFriend extends HomeEvent{
  int id;
  String status;
  ChangeRequestsFriend({
    required this.id,
    required this.status,
  });
}
