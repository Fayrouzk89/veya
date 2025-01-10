import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:veya_club/Utils/CommonConstants.dart';
import '../../Utils/AppFonts.dart';
import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import '../../Utils/sizes_consts.dart';
import '../../Utils/style.dart';
import '../../Widget/ButtonWidget.dart';
import '../../Widget/CommonWidget.dart';
import 'FooterWidget1.dart';
import '../../Helper/ImageAssetsHelper.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Responsive padding
    final screenPadding = MediaQuery.of(context).size.width * CommonConstants.paddingHorizontal;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Image Widget
              ImageAssetsHelper.getImageAssetsWithFit(
                ImageAssetsHelper.imgAuth,
                double.infinity,
                200,
                BoxFit.contain,
              ),
              const SizedBox(height: 20),
              // Welcome Text
              Text(
                "welcome".tr(),
                textAlign: TextAlign.center,
                style: AppFonts.fontBoldLarge,
              ),
              const SizedBox(height: 10),
              // Title Text
              Text(
                "title".tr(),
                textAlign: TextAlign.center,
                style: AppFonts.fontRegularMeduim.copyWith(color: greyColor),
              ),
              const SizedBox(height: 20),
              // Button Widget
              ButtonWidget(
                onPress: onPressButton,
                title: 'start_now'.tr(),
                buttonColor: primaryColor,
                titleColor: whiteColor,
                borderColor: primaryColor,
                paddingHorizontal: 20.0,
                paddingVertical: SizesConstant.verticalButtonPad,
                size: 0,
              ),
              const SizedBox(height: 20),
              // Footer Widget
               FooterWidget1(),
            ],
          ),
        ),
      ),
    );
  }

  void onPressButton() async {
    Navigator.pushNamed(
      Navigation.getContext(),
      Routes.homeScreen,
    );
  }
}
