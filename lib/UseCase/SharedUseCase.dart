import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:veya_club/Api/apiResponse/VeraUser.dart';
import 'package:veya_club/Helper/LocalDataHelper.dart';
import '../Api/apiBody/AuthBody.dart';
import '../Api/apiBody/RegisterBody.dart';
import '../Api/apiBody/ResendBody.dart';
import '../Api/apiBody/ResetBody.dart';
import '../Api/apiBody/loginBody.dart';
import '../Api/apiResponse/AuthResponse.dart';
import '../Api/apiResponse/FailureResponse.dart';
import '../Api/apiResponse/LoginResponse.dart';
import '../Api/apiResponse/SignUpResponse.dart';
import '../Api/network/app_consts.dart';
import '../Api/network/faiure.dart';
import '../Api/network/repository.dart';
import 'package:easy_localization/easy_localization.dart';

import '../Common/UserInfo.dart';
import '../Helper/MessageHelper.dart';
import '../Helper/PrefConsts.dart';
import '../Helper/PreferenceSettingsHelper.dart';
import '../Helper/SharedHelper.dart';

class SharedUseCase {
  final Repository _repository;

  SharedUseCase(this._repository);

  Future<VeraUser?> executeGetUserInfo() async {
    String url=AppConsts.users+"/"+LocalDataHelper.userInfo!.id.toString();
    Either<Failure, dynamic>result = await _repository.CallDynamic(url, 1);
    if (result.isLeft()) {
      int x=1;
      Failure left = (result as Left).value;
      if(left.message!=null)
      {
        RegExp regExp = RegExp(r":\s*(.*?)\}");

        // Match the pattern in the input string
        Match? match = regExp.firstMatch(left.message);

        // Extract and print the result if a match is found
        if (match != null) {
          String result = match.group(1) ?? '';
          MessageHelper.showMessageWithoutContext(result);
          print(result); // Output: No active account found with the given credentials
        } else {
          MessageHelper.showMessageWithoutContext(left.message);
        }

      }
    }
    else {
      dynamic right=(result as Right).value;
     VeraUser veraUser =VeraUser.fromJson(right);
      return veraUser;
    }

    return null;
  }
  Future<bool> executeLogin(UserInfo userInfo) async {
    bool res = false;
    loginBody body=loginBody(userInfo.email!,userInfo.password!);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.login, 1,body);
    if (result.isLeft()) {
      res = false;
      Failure left = (result as Left).value;
      displayErrorMessage(left.message);
    }
    else {
      LoginResponse right = LoginResponse.fromJson((result as Right).value);
      if(right.success)
        {
          res=true;
          await LocalDataHelper.saveLogin(right);
          await SharedHelper.initAppModule("");
        }
      else{
        res = false;
        displayErrorMessage(right.message!);

      }
    }

    return res;
  }
  displayErrorMessage(String message)
  {
    if(message!="") {
      MessageHelper.showMessageWithoutContext(message!);
    } else {
      MessageHelper.showMessageWithoutContext("invalid_username_password".tr());
    }
  }
 Future<bool> executeRegister(UserInfo userInfo) async
  {
    bool res = false;
    RegisterBody body=RegisterBody(userInfo.email!,userInfo.mobile!,userInfo.user_name!,userInfo.password!);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.register, 2,body);
    if (result.isLeft()) {
      res = false;
      int x=1;
      Failure left = (result as Left).value;
      if(left.message!=null)
      {
        RegExp regExp = RegExp(r":\s*(.*?)\}");

        // Match the pattern in the input string
        Match? match = regExp.firstMatch(left.message);

        // Extract and print the result if a match is found
        if (match != null) {
          String result = match.group(1) ?? '';
          MessageHelper.showMessageWithoutContext(result);
          print(result); // Output: No active account found with the given credentials
        } else {
          MessageHelper.showMessageWithoutContext(left.message);
        }

      }
      else
      {
        MessageHelper.showMessageWithoutContext("error_signUp_info".tr());
      }
      /*
      FailureResponse left = (result as Left).value;
      SessionHandler.handelErrorMessage(
          left.error ?? "error_registration".tr());

       */
    }
    else {

      SignUpResponse right = SignUpResponse.fromJson((result as Right).value);
      if(right.success)
      {
        res=true;

      }
      else{
        res = false;

        MessageHelper.showMessageWithoutContext("error_signUp_info".tr());
      }


    }

    return res;
  }
  Future<bool> authUser(String code,String phone) async
  {
    bool res = false;
    AuthBody body=AuthBody(code, phone);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.verify, 3,body);
    if (result.isLeft()) {
      res = false;
      int x=1;
      Failure left = (result as Left).value;
      if(left.message!=null)
      {
        RegExp regExp = RegExp(r":\s*(.*?)\}");

        // Match the pattern in the input string
        Match? match = regExp.firstMatch(left.message);

        // Extract and print the result if a match is found
        if (match != null) {
          String result = match.group(1) ?? '';
          MessageHelper.showMessageWithoutContext(result);
          print(result); // Output: No active account found with the given credentials
        } else {
          MessageHelper.showMessageWithoutContext(left.message);
        }

      }
      else
      {
        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }
    else {

      AuthResponse right = AuthResponse.fromJson((result as Right).value);
      if(right.success)
      {
       if(right.message!.contains("activated"))
        res=true;
       else
         {
           MessageHelper.showMessageWithoutContext(right.message!);
         }

      }
      else{
        res = false;

        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }

    return res;
  }
  Future<bool> resetPassword(String phone,String code,String password) async
  {
    bool res = false;

    ResetBody body=ResetBody(phone,password,code);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.reset, 3,body);
    if (result.isLeft()) {
      res = false;
      int x=1;
      Failure left = (result as Left).value;
      if(left.message!=null)
      {
        RegExp regExp = RegExp(r":\s*(.*?)\}");

        // Match the pattern in the input string
        Match? match = regExp.firstMatch(left.message);

        // Extract and print the result if a match is found
        if (match != null) {
          String result = match.group(1) ?? '';
          MessageHelper.showMessageWithoutContext(result);
          print(result); // Output: No active account found with the given credentials
        } else {
          MessageHelper.showMessageWithoutContext(left.message);
        }

      }
      else
      {
        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }
    else {

      AuthResponse right = AuthResponse.fromJson((result as Right).value);
      if(right.success)
      {
        if(right.message!.contains("activated"))
          res=true;
        else
        {
          MessageHelper.showMessageWithoutContext(right.message!);
        }

      }
      else{
        res = false;

        MessageHelper.showMessageWithoutContext("error_auth_info".tr());
      }
    }



    return res;
  }

  resetUserPassword(String phone) async
  {
    bool res = false;

    ResendBody body=ResendBody(phone);
    Either<Failure, dynamic>result = await _repository.CallPostDynamic(AppConsts.resend_auth_code, 3,body);
    if (result.isLeft()) {
      res = false;
      int x=1;
      Failure left = (result as Left).value;
      if(left.message!=null)
      {
        RegExp regExp = RegExp(r":\s*(.*?)\}");

        // Match the pattern in the input string
        Match? match = regExp.firstMatch(left.message);

        // Extract and print the result if a match is found
        if (match != null) {
          String result = match.group(1) ?? '';
          MessageHelper.showMessageWithoutContext(result);
          print(result); // Output: No active account found with the given credentials
        } else {
          MessageHelper.showMessageWithoutContext(left.message);
        }

      }
      else
      {
        MessageHelper.showMessageWithoutContext("error_send_code".tr());
      }
    }
    else {


    }
  }
  resendCode(String phone) async
  {

  }





}
