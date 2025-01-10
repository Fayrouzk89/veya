import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Color themeColor=Color(0xff032B44);
Color backColor=const Color(0xfffffff);
Color buttonOk=Color.fromRGBO(0, 179, 134, 1.0);
Color buttonCancel=Colors.red;

// Orange Color with Opacity 20 - 80 %
Color orangeColor = HexColor('#032B44');
Color primaryColor = HexColor('#032B44');
Color mainBackground=HexColor('#fbfaff');
Color btnColor=HexColor("#33393939");
Color msgColor=HexColor("#1F393939");
Color textColor= HexColor('#6B7280');
Color whiteColorCustom=HexColor("#ffffff");
Color whiteBack= HexColor('#ffffff');
Color greyColor=HexColor('#BEBEBE');

Color orangeColor80 = HexColor('#FE8160');
Color orangeColor50 = HexColor('#FEA58D');
Color orangeColor20 = HexColor('#FED2C7');

Color blackColor1 = HexColor('#424244');
// Yellow Color with Opacity 20 - 80 %
Color yellowColor = HexColor('#FFC529');
Color yellowColor80 = HexColor('#FFD050');
Color yellowColor50 = HexColor('#FFDF8B');
Color yellowColor20 = HexColor('#FFEFC3');

// Black Color with Opacity 20 - 80 %
Color blackColor = HexColor('#1A1D26');
Color blackColor80 = HexColor('#2A2F3D');
Color blackColor50 = HexColor('#4D5364');
Color blackColor20 = HexColor('#6E7489');

// Gray Color with Opacity 20 - 80 %
Color grayColor = HexColor('#9A9FAE');
Color grayColorBorder = HexColor('#dddde0');
Color grayColor1 =Color(0xFFBDBDBD);
Color grayColor80 = HexColor('#A8ACB9');
Color grayColor50 = HexColor('#C4C7D0');
Color grayColor20 = HexColor('#EBEBEB');

Color busyColor1 = HexColor('#dd3333');
Color busyColor2 = HexColor('#d11616');

Color disableColor1 = HexColor('#b5b5b5');
Color disableColor2 = HexColor('#6c6a6a');

Color printColor1 = HexColor('#AC92EC');
Color printColor2 = HexColor('#967ADC');

const Color whiteColor = Colors.white;

const String sofia = 'sofia';

final Color secondaryColor = Color(0xff092B47);
final Color primaryTextColor = Color(0xff0D2145);
final Color secondaryTextColor = Color(0xff768791);
final Color white = Color(0xffFFFFFF);
final Color black = Color(0xff45597A);
final Color grey = Color(0xffC4C4C4);
final Color backgroundColor = Color(0xffF3F5F8);
const secondary = Color(0xFFFFA837);
const darker = Color(0xFF3E4249);
const cardColor = Color(0xFFEDF0F3);
const mainColor = Color(0xFF000000);
const appBgColor = Color(0xFFFAFAFA);
const shadowColor = Colors.black87;
const textBoxColor = Color(0xFFe9e9e9);

const bottomBarColor = Colors.black;
const inActiveColor = Color(0xFF3E4249);

const yellow = Color(0xFFffcb66);
const green = Color(0xFFb2e1b5);
const pink = Color(0xFFf5bde8);
const purple = Color(0xFFd9bcff);
const red = Color(0xFFFF968A);
const orange = Color(0xFFFFC8A2);
const sky = Color(0xFFABDEE6);
const blue = Color(0xFF509BE4);

const Color kBackground = Color(0xFFF5F5F5);
const Color kPrimaryColor = Color(0xFFFDB730);
Color itemListColor = Color(0xFFEEEEEE);
Color subtitleGray = Color(0xB7B6B6);

const TextTheme textTheme = TextTheme(
  headline4: TextStyle(
    fontFamily: sofia,
    //fontSize: 28,
    fontWeight: FontWeight.w700,
    // letterSpacing: 0.25,
  ),
  headline5: TextStyle(
    fontFamily: sofia,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  headline6: TextStyle(
    fontFamily: sofia,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  ),
  subtitle1: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  caption: TextStyle(
    fontFamily: sofia,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  ),
  button: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),

);
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );

}
List<Color>  gradientColors = [

  Color( 0xff07489C),
  Color( 0xff68FA1E),
  Color(0xfffe161D),
  Color(0xffFFc107),
  Color( 0xff13A6C3),
  Color( 0xfff57C00),
  Color( 0xff165DC0),
  Color(  0xff431037),
  Color(  0xffe91E63),
  Color(0xff0ff1ce)  ,
  Color(0xffd798ba),
  Color(0xffff3f3f),
  Color(0xff21618C),
  Color(0xffffb0b2),
  Color(0xffcaad13),
  Color(0xffa19c9c),
  Color(0xff74d680),
  Color(0xff61538D),
  Color(0xffABEBC6),
  Color(0xffA569BD ),
  Color(0xffF1948A ),
];
Color getColorIndex(int i)
{
  Color _color=Colors.cyan;
  switch (i % 10) {
    case 0:
      _color = gradientColors[0];
      break;
    case 1:
      _color = gradientColors[1];
      break;
    case 2:
      _color = gradientColors[2];
      break;
    case 3:
      _color = gradientColors[3];
      break;
    case 4:
      _color =gradientColors[4];
      break;
    case 5:
      _color = gradientColors[5];
      break;
    case 6:
      _color =gradientColors[6];
      break;
    case 7:
      _color =gradientColors[7];
      break;
    case 8:
      _color = gradientColors[8];
      break;
    case 9:
      _color = gradientColors[9];
      break;
    default:
      _color = Colors.cyan;
  }
  return _color;
}
List<Color>  gradientColorsRep = [
  Color( 0xffABB2B9),
  Color(0xff85C1E9),
  Color(0xffF4D03F),
  Color(0xffA569BD),
  Color(0xff76D7C4),
  Color( 0xffFF756D),
  Color(  0xffb3b333),
  Color(  0xffAED6F1),
  Color( 0xffBDC3C7),
  Color(0xff61538D),
];
List<Color>  gradientColorsRep1 = [
  Color( 0xff2C3E50),
  Color(0xff21618C),
  Color(  0xff9A7D0A ),
  Color(0xff5B2C6F),
  Color(0xff117864),
  Color( 0xff994641 ),
  Color(  0xff868626),
  Color( 0xff6495ED),
  Color( 0xff797D7F),
  Color(0xff433a62),
];

const eventColors = [
  Colors.deepOrange,
  Colors.greenAccent,
  Colors.pink,
  Colors.green,
  Colors.indigoAccent,
  Color(0xff85C1E9),
  Color(0xffA569BD),
  Color(0xff76D7C4),
  Color( 0xffFF756D),
  Color(  0xffb3b333),
  Color(  0xffAED6F1),
  Color(0xffBEBEBE),
];
Color getColor(String catId)
{
  int id=0;
  try{
    id=int.parse(catId);

  }
  catch(e)
  {

  }
  return eventColors[id%10];
}
double borderRaduis=10;