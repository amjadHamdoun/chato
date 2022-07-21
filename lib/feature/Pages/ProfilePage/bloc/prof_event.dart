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


class GetBlockedUserEvent extends ProfEvent{

}

class GetCountriesUserEvent extends ProfEvent{

}

class UnBlockedUserEvent extends ProfEvent{

  int blockedId;
  UnBlockedUserEvent({
    required this.blockedId
  });
}

class UpdateUserInfoEvent extends ProfEvent{
 File? image;
 String? gender;
 String? name;
 String? birthDate;
 int? country_id;
 UpdateUserInfoEvent({
   required this.image,
   required this.gender,
   required this.name,
   required this.country_id,
   required this.birthDate
});
}



class ChangePasswordEvent extends ProfEvent{
  String oldPassword;
  String password;
  String confirmPassword;
  ChangePasswordEvent({
    required this.oldPassword,
    required this.password,
    required this.confirmPassword
  });
}

class ResetParamEvent extends ProfEvent{

}

class SendCoinsEvent extends ProfEvent{
   String userReceivedId;
   String numberOfCoinsOrDiamond;
   String type;
   SendCoinsEvent({required this.type,
   required this.numberOfCoinsOrDiamond,
     required this.userReceivedId
   });
}