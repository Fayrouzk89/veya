import 'package:flutter/cupertino.dart';
import 'SizeConfig.dart';
import 'package:responsive_framework/responsive_framework.dart';


class SizesConstant
{
  static double roundedCorner=30;
  static double containerHeight=180;
  static double imageHeight=100;
  static double percentWeb=70;
  static double webSizedHeight=15;
  static double webMarginSmall=0.2;

  static double webMargin=0.25;
  static double rightButton=10;
  static double leftButton=10;
  static double buttonPercent=0.2;
  static double maxScreen=930;
  static double dialogwidth=0.6;
  static double border_radius_circular=12;
  static double input_height=50;
  static double inputPadding=16;
  static double inputTextPadding=10;
  static double inputTextVerticalPadding=5;

  static double sizedBoxHeight=8;
  static double appBarTop= 37;
  static double appBarLeft= 27;
  static double appBarRight= 27;
  static double appBarPadding=10;
  static double appBarfont=16;
  static double appBarfont1=14;

  static double formTop= 15;
  static double formLeft= 10;
  static double formRight= 10;

  static double title=18;
  static double subTitle=16;
  static double textPage=14;
  static double textPagesmall=10;
  static double iconSize=40;

  static double horizontalPaddingWeb=50;
  static double getHorizontalPaddingMobile()
  {
    return 10;
  }
  static double verticalButtonPad=10;
  static double verticalButtonPadWeb=3;
  static double webNumber=70;
  static double mobileNumber=50;
  static double screenWidth=400;
  static double circularRadius=8;
 static initWidth(BuildContext context)
  {
    screenWidth= ResponsiveValue<double>(context,
        defaultValue: 150,
        conditionalValues: [
      Condition.equals(name: MOBILE, value: 120),
      Condition.between(start: 800, end: 1100, value: 180),
      Condition.between(start: 1000, end: 1200, value: 200),
      // There are no conditions for width over 1200
      // because the `maxWidth` is set to 1200 via the MaxWidthBox.
    ]).value!;
  }
  static double getBorder()
  {
    return SizeConfig().screenWidth>450?3:2;
  }
  static double getDialogImage()
  {
    return SizeConfig().screenWidth>300?100:50;
  }
}