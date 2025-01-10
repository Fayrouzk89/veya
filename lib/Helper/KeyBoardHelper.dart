import 'package:flutter/cupertino.dart';

class KeyBoardHelper
{
  static hideKeyboard(BuildContext context)
  {
    FocusScope.of(context).unfocus();
  }
}