import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/LocalDataHelper.dart';
import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
class SplashController
{

  Future<void> authenticate(BuildContext context) async {
   await Future.delayed(Duration(seconds: 6), () {
      print('Delayed code executed');
    });
   openNext(context);
  }
  openNext(BuildContext context)async
  {

    bool result=await LocalDataHelper.isUserExists();
    Navigator.pushReplacementNamed(
      Navigation.getContext(),
      Routes.scanScreen,
    );
    /*
    if(result==false)
    {
      Navigator.pushReplacementNamed(
        Navigation.getContext(),
        Routes.scanScreen,
      );
    }
    else
      {
        Navigator.pushReplacementNamed(
          Navigation.getContext(),
          Routes.homeScreen,
        );
      }

     */
  }

}