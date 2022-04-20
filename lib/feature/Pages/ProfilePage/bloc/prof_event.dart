import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: camel_case_types
class getFriendShipEvent extends ProfEvent{

}
// ignore: camel_case_types
class LogoutEvent extends ProfEvent {
}
// ignore: camel_case_types
class getProfileDetailsEvent extends ProfEvent{

}
// ignore: camel_case_types
class getCountFriendEvent extends ProfEvent{

}
