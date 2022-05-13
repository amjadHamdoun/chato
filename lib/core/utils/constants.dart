import 'package:easy_localization/easy_localization.dart';

class Endpoints {

  static const baseURL = 'https://www.room.tecknick.net/api/';
  static const register = 'auth/register';
  static const login = 'auth/login';
  static const friendShipRequests = 'friendship-requests';
  static const searchFriend = 'search-friend';
  static const logout = 'auth/logout';
  static const profileDetails = 'auth/user';
  static const friendsDetails =  'details-friend';
  static const countFriend = 'count-friend';
  static const changeRequestsFriend = 'change-requests-friend';
  static const addFriend = 'add-friend';
  static const updateUserInfo = 'auth/update/user/info';
  static const getAllFriend = 'get-all-friend';
  static const forgetPassword = 'auth/forgetPassword';
  static const changePassword = 'auth/change_password';
  static const createRoom = 'room/create-room';
  static const getUserAllRoom = 'room/get-user-all-room';
  static const getFavRoom = 'room/get-favorite-room';
  static const getTrendRoom = 'room/get-all-trend';
  static const getAllRoom = 'room/get-all-room';
  static const getAllUserVipRoom= 'room/all-user-vip-room';
  static const addRoomTrend = 'room/add-room-trend';
  static const getConversationOldMessage = 'room/get-conversation-old-message';
  static const getAllBlockUser = 'get-all-block-user';
  static const unblockUser = 'unblock-user';
  static const allTypeRoom = 'room/all-type-room';
  static const sendMessage = 'room/send-message';

}


class Er {

  static String error = tr("Something went wrong");
  static String networkError = tr("Check your internet connection");

}
