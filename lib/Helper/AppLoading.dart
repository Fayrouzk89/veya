import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class AppLoading
{
  static void setLoading(String message) {

    // ..displayDuration = const Duration(milliseconds: 5000)
    EasyLoading.instance  ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
    // ..progressColor = Colors.yellow
    // ..backgroundColor = Colors.green
    // ..indicatorColor = Colors.yellow
    //..textColor = Co.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
    ;
    EasyLoading.show(status: message);
  }

  static void hideLoading() {
    try {
      print("hide loading");
      EasyLoading.dismiss();
    }
    catch(e)
    {

    }
  }
}