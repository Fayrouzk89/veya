import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as toastWithoutcontext;
class MessageHelper
{
  static void showMessage(BuildContext context,String msg)
  {
    var snackBar = SnackBar(
        content: Text(msg,style: TextStyle(),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static void showMessageWithout(BuildContext context,String msg)
  {
    toastWithoutcontext.Fluttertoast.showToast(
        msg: msg,
        toastLength: toastWithoutcontext.Toast.LENGTH_SHORT,
        gravity: toastWithoutcontext.ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        webBgColor: Colors.black,
        webShowClose: true,
        webPosition:"bottom",
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  static void showMessageWithoutContext(String msg)
  {
    toastWithoutcontext.Fluttertoast.showToast(
      msg: msg,
      toastLength: toastWithoutcontext.Toast.LENGTH_SHORT,
      gravity: toastWithoutcontext.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }
}