import 'package:easy_localization/easy_localization.dart';

class Endpoints {
  static const baseURL = 'https://www.room.tecknick.net/api/';
  static const register = 'auth/register';
  static const login = 'auth/login';
  static const friendShipRequests = 'friendship-requests';
  static const logout = 'auth/logout';
  static const profileDetails = 'auth/user';
  static const friendsDetails =  'details-friend';
  static const countFriend = 'count-friend';
  static const changeRequestsFriend = 'change-requests-friend';
  static const  addFriend = 'add-friend';



}

class Er {

  static String error = tr("Something went wrong");
  static String networkError = tr("Check your internet connection");

}
