// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class ProfEvent extends Equatable {
  @override
  List<Object> get props => [];
}




class LogoutEvent extends ProfEvent {
}

class GetProfileDetailsEvent extends ProfEvent{

}

class GetCountFriendEvent extends ProfEvent{

}


class ChangeImageEvent extends ProfEvent{
 File image;
 ChangeImageEvent({
   required this.image
});
}