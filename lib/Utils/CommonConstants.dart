import 'SizeConfig.dart';

class CommonConstants {
  //Strings
 static double raduis=15;
 static double btnHeight=29;
 static double searchHeight=45;
 static double itemSpacing=10;
 static int itemCount=2;
 static double itemExtend=200;
 static double getCartWidth()
  {
    return SizeConfig().screenWidth*0.3;
  }
  static double productImgWidth = 0.4;
  static double categoryWidth = 0.16;
  static double aspect=0.8;
  static const String bottomFooter= 'copyright at @alofra';
  static const double height_padding=5;
  static const String test = 'test';
  static const num testNum = 1;
  static const double headerText = 50.0;
  static const double largeText = 20.0;
  static const double meduimText = 14.0;

  static const double normalText = 18.0;
  static const double smallText = 12.0;
  static const double appBarText = 22.0;

  //fonts
  static const String largeTextFont="Segoe_UI";
  static const String introTextFont="Roboto";
  static const String sfHeader="SF-Pro-Display";

  //button size
  static double roundedHeight =SizeConfig().screenWidth * 0.12;
  static double roundedHeightSmall =40;

  static double textButton =SizeConfig().screenWidth * 0.04;
  static double textApp =16;

  static double horizontalPaddingButton =20;
  static double verticalPaddingButton =10;

  //text
  static double hintSizes =15;

  static double paddingBottom =40;
  static double paddingHorizontal =0.05;

  static double paddingleft =8;
  static double paddingright =8;

  static double listViewHeight=250;
  static double imageHeight=100;
  static double remainHeight=140;
  static double remainWidth=60;

  static int phoneLength=14;

  static double appBarHeight=160;
  static double appBarImageHeight=135;
  static double appBarImageWidth=150;
  static double appBarImagePaddingTop=22;
static String formatPhoneNumber(String number) {
  if (number.startsWith('00')) {
   // Replace '00' at the start with '+'
   number = number.replaceFirst('00', '+');
  } else if (!number.startsWith('+')) {
   // If the number doesn't start with '+', add it
   number = '+$number';
  }
  return number;
 }
}