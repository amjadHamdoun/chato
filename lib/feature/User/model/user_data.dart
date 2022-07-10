import 'package:chato/feature/User/model/user_friend.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../BuyFeaturedUser/model/vip_data_model.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final int? id;
  final String? name;
  final String? email;
  final String? img;
  final String? birth_date;
  final String? gender;
  final String? token;
  final List?  gift_transaction_s;
  final List?  gift_transaction_r;
  final UserFriend? userfriend;
  final List? friend;
  final List? block;
   var viewers;
  VipDataModel?  vip_user;
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  UserData( {
     this.token,
     this.name,
     this.email,
     this.id,
     this.img,
     this.birth_date,
     this.gender,
     this.vip_user,
    this.gift_transaction_r,
    this.gift_transaction_s,
    this.block,
    this.friend,
    this.userfriend,
    this.viewers

  });
}
