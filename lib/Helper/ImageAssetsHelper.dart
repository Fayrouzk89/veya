import 'package:flutter/cupertino.dart';
import 'package:veya_club/Helper/LocalDataHelper.dart';

class ImageAssetsHelper
{
  static String imagePath="assets/images/";
  static String left="${imagePath}pulsar.png";
  static String right="${imagePath}wings.png";
  static String handel="${imagePath}handel.png";
  static String placeholder="${imagePath}placeholder.png";
  static String fitness="${imagePath}fitness.png";
  static String fitnessDark="${imagePath}fitness_black.png";
  static String arrow="${imagePath}arrow.png";
  static String arrowBack="${imagePath}arrow_back.png";
  static String messages="${imagePath}messages.png";
  static String messagesDark="${imagePath}messages_black.png";


  static String imgAuth= "${imagePath}img_auth.png";
  static String logoApp="${imagePath}logo_app.png";
  static double imageHeight1=90;
  static double imageHeight2=30;
  static double imagePadding=2;

  static String getImagePathMain(bool isLeft,double page)
  {
    print("get image "+isLeft.toString() +" "+page.toString());
    if(isLeft)
      {
        return
        (LocalDataHelper.getLang())?
        (page==0.0)?ImageAssetsHelper.messagesDark:
        (page<=0.001)? ImageAssetsHelper.messagesDark :ImageAssetsHelper.messages:
        (page>1.8)? ImageAssetsHelper.messagesDark:ImageAssetsHelper.messages
        ;
      }
     else
       {
         return
           (LocalDataHelper.getLang())?
           (page<=1.97)?ImageAssetsHelper.fitness:ImageAssetsHelper.fitnessDark:
           (page<=0.001)?ImageAssetsHelper.fitnessDark:ImageAssetsHelper.fitness
            ;
       }
  }
 static Widget getImageAssets(String path,double width,double height)
  {
    return Image.asset(
     path,
      width: width,
      height: height,
    );
  }
  static Widget getImageAssetsWithFit(String path,double width,double height,BoxFit boxFit)
  {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: boxFit,
    );
  }

}