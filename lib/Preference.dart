import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;
  static const String KEY_IS_First_Time = 'key_is_first_time';

  static const String KEY_UserToken = 'key_UserToken';

  static const String KEY_UserId = 'key_UserId';

  static const String KEY_UserName = 'key_UserName';


  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveIsFirstTime(bool isFirstTime) async {
    preferences!.setBool(KEY_IS_First_Time, isFirstTime);

  }
  static bool? getIsFirstTime() {
    bool? first = preferences!.getBool(KEY_IS_First_Time);
    if(first==null)
    {
      return true;
    }
    else
      return first;
  }

  static void saveUserToken(String userToken) async {
    preferences!.setString(KEY_UserToken, userToken);
  }

  static String? getUserToken() {
    String? userToken = preferences!.getString(KEY_UserToken);
     if(userToken==null)
       {
         return '';
       }
     else
    return userToken;
  }

  static void saveUserName(String userName) async {
    preferences!.setString(KEY_UserName, userName);
  }

  static String? getUserName() {
    String? userName = preferences!.getString(KEY_UserName);
    if(userName==null)
    {
      return '';
    }
    else
      return userName;
  }

  static void saveUserId(int userId) async {
    preferences!.setInt(KEY_UserId, userId);
  }

  static int? getUserId() {
    int? userId = preferences!.getInt(KEY_UserId);
    if(userId==null)
    {
      return 0;
    }
    else
      return userId;
  }


}
