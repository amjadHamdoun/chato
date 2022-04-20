import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvents extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetUserDetailsEvent extends UserEvents {

}
class AddFriendEvent extends UserEvents{

}
