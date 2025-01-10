import 'dart:io';

import 'package:flutter/material.dart';
import '../Api/apiResponse/LoginResponse.dart';
import '../Api/apiResponse/VeraUser.dart';
import '../Common/UserInfo.dart';
import '../Helper/PrefConsts.dart';
import 'PreferenceSettingsHelper.dart';
import 'SharedHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataHelper
{
  static String mobile="";
  static UserInfo? userInfo;
  static ValueNotifier<int> currentPageNotifier=ValueNotifier(0);

  static String lang="en";
  static Future<bool> isUserExists()async
  {
    PreferenceSettingsHelper? preferenceSettingsHelper=await SharedHelper.getHelper();
    final sharedPreferences =await preferenceSettingsHelper.sharedPreferences;
    bool isLogin =sharedPreferences.getBool(PrefConsts.isLogin)??false;
    if(isLogin)
      {
        await loadUser(sharedPreferences);
        return true;
      }
    else
    return false;
  }
 static loadUser(SharedPreferences sharedPreferences)
  {
    int id=sharedPreferences.getInt(PrefConsts.user_id)??-1;
    if(id!=-1)
      {
    UserInfo userInfo=UserInfo(id: -1, user_name: "user_name", email: "email", mobile: "mobile", password: "password");
    userInfo.refresh=sharedPreferences.getString(PrefConsts.refresh)??"";
    userInfo.access=sharedPreferences.getString(PrefConsts.access)??"";
    userInfo.user_name=sharedPreferences.getString(PrefConsts.user)??"";
    userInfo.id=sharedPreferences.getInt(PrefConsts.user_id)??-1;
    userInfo.email=sharedPreferences.getString(PrefConsts.email)??"";
    LocalDataHelper.userInfo=userInfo;
      }
  }
static  saveLogin( LoginResponse right)async
  {
    PreferenceSettingsHelper preferenceSettingsHelper=await SharedHelper.getHelper();
    final sharedPreferences =await preferenceSettingsHelper.sharedPreferences;
    if(right.user!=null)
    {
      sharedPreferences.setString(PrefConsts.refresh, right.token!);
      sharedPreferences.setString(PrefConsts.access, right.token!);
      sharedPreferences.setBool(PrefConsts.isLogin, true);
      saveUserInfo(sharedPreferences,right.user!);
      sharedPreferences.commit();
      await loadUser(sharedPreferences);
    }
  }
  static saveUserInfo(SharedPreferences sharedPreferences,VeraUser user)
  {
    sharedPreferences.setString(PrefConsts.user, user.username!);
    sharedPreferences.setInt(PrefConsts.user_id, user.id!);
    sharedPreferences.setString(PrefConsts.email,  user.email!);
    sharedPreferences.setString(PrefConsts.phone_number,  user.phoneNumber!);
    sharedPreferences.setString(PrefConsts.first_name,  user.firstName!);
    sharedPreferences.setString(PrefConsts.last_name,  user.lastName!);
    sharedPreferences.setString(PrefConsts.role, user.role!);
    sharedPreferences.setString(PrefConsts.birthdate,  user.birthdate!);
    sharedPreferences.setInt(PrefConsts.age,  user.age!);
    sharedPreferences.setDouble(PrefConsts.height,  user.height!);
    sharedPreferences.setDouble(PrefConsts.weight, user.weight!);
  }
  static bool getLang()
  {
    if(LocalDataHelper.lang=="ar")
    {
      return false;
    }
    return true;
  }

}