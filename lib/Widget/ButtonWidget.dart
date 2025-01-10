import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Utils/AppFonts.dart';
import '../Utils/context_extensions.dart';

import '../../Utils/SizeConfig.dart';



class ButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color buttonColor, titleColor, borderColor;
  final double paddingVertical, paddingHorizontal;
  final double size;
  const ButtonWidget({
    required this.onPress,
    required this.title,
    required this.buttonColor,
    required this.titleColor,
    required this.borderColor,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: paddingVertical,horizontal: paddingHorizontal),
      width: (size==0)?SizeConfig().screenWidth:size,
      height: 45,
      decoration: BoxDecoration(
        color: borderColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border:Border.fromBorderSide(
          BorderSide(
            color: const Color(0x00000000),
            width: 0,
            style: BorderStyle.solid,
          ),
        ) ,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          highlightColor: Theme.of(context).highlightColor,
          splashColor:  Theme.of(context).splashColor,
          onTap: onPress,
          child: Padding(
            padding: EdgeInsets.all(1),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppFonts.fontRegularMeduim.copyWith(
                  fontWeight: FontWeight.w300,
                  color: titleColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}