import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import '../../Utils/AppFonts.dart';
import '../../Utils/CommonConstants.dart';
import '../../Utils/style.dart';

class FooterWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            //  Get.toNamed(Routes.HOME);
          },
          child: Text(
            "dosent_have".tr(),
            textAlign: TextAlign.center,
            style: AppFonts.fontRegularMeduim,
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              Navigation.getContext(),
              Routes.registerScreen,
            );
          },
          child: Text(
            "sign_up".tr(),
            textAlign: TextAlign.center,
            style: AppFonts.fontBoldMeduim.copyWith(color: primaryColor),
          ),
        ),
      ],
    );
  }
}