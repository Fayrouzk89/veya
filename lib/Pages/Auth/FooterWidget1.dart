import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import '../../Utils/AppFonts.dart';
import '../../Utils/style.dart';

class FooterWidget1 extends StatelessWidget {


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
           "have_account".tr(),
           textAlign: TextAlign.center,
           style: AppFonts.fontRegularMeduim,
         ),
       ),
       const SizedBox(width: 10,),
       GestureDetector(
         onTap: () {
           Navigator.pushNamed(
             Navigation.getContext(),
             Routes.loginScreen,
           );
         },
         child: Text(
           "sign_in".tr(),
           textAlign: TextAlign.center,
           style: AppFonts.fontBoldMeduim.copyWith(color: primaryColor),
         ),
       ),
     ],
   );
  }
}