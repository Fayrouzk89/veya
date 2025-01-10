import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/ImageAssetsHelper.dart';
import '../../Helper/LocalDataHelper.dart';
import '../../Pages/Auth/AuthController.dart';
import '../../../Helper/MessageHelper.dart';
import '../../../Utils/CommonConstants.dart';
import '../../../Utils/sizes_consts.dart';
import '../../../Utils/style.dart';
import '../../../Widget/ButtonWidget.dart';
import '../../../Widget/CommonWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../Helper/AppLoading.dart';
import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import '../../Utils/AppFonts.dart';


class ConfirmScreen extends StatefulWidget {
  @override
  State<ConfirmScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ConfirmScreen> {


  AuthController authController=AuthController();
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: whiteBack,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: CommonConstants.paddingBottom),
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(
                      horizontal: CommonConstants.paddingHorizontal),
                  child: _buildForms(context),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  void onClick() {}

  Widget _buildForms(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30,),
          ImageAssetsHelper.getImageAssetsWithFit(
            ImageAssetsHelper.imgAuth,
            double.infinity,
            50,
            BoxFit.contain,
          ),
          CommonWidget.rowHeight(height: 10),

          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the button
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.grey, // Set the border color
                width: 0.5,         // Set the border width
              ),
              borderRadius: BorderRadius.circular(15),  // Makes the container round
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildFormSignUp(),
            ),),

        ],
      ),
    );
  }
  Widget buildFormSignUp()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonWidget.rowHeight(height: 20),
        Text(
          "enter_validation_code".tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: CommonConstants.meduimText,
              color: textColor,
              fontWeight: FontWeight.bold,
              fontFamily: CommonConstants.largeTextFont),
        ),
        CommonWidget.rowHeight(height: 20),
        ImageAssetsHelper.getImageAssetsWithFit(
          ImageAssetsHelper.logoApp,
          double.infinity,
          100,
          BoxFit.contain,
        ),
        CommonWidget.rowHeight(height: 20),
        buildNumberField(),
        ButtonWidget(
          onPress: () => doConfirm(),
          title: 'confirm'.tr(),
          buttonColor: primaryColor,
          titleColor: whiteColor,
          borderColor: primaryColor,
          paddingHorizontal: 20.0,
          paddingVertical:
          SizesConstant.verticalButtonPad,
          size: 0,
        )
      ],
    );
  }
  bool _onEditing = true;
  String? _code;
  Widget buildNumberField(){
    return  Column(
      children: [
        VerificationCode(
          textStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Theme.of(context).primaryColor),
          fullBorder: true,
          keyboardType: TextInputType.number,
          underlineColor: Colors.black, // If this is null it will use primaryColor: Colors.red from Theme
          length: 4,
          cursorColor:primaryColor, // If this is null it will default to the ambient
          // clearAll is NOT required, you can delete it
          // takes any widget, so you can implement your design

          margin: const EdgeInsets.all(12),
          onCompleted: (String value) {
            setState(() {
              _code = value;
            });
          },
          onEditing: (bool value) {
            setState(() {
              _onEditing = value;
            });
            if (!_onEditing) FocusScope.of(context).unfocus();
          },
        ),
        CommonWidget.rowHeight(height: 30),
        buildResendCode(),
        CommonWidget.rowHeight(height: 30),

      ],
    );
  }
  Widget buildResendCode()
  {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            //  Get.toNamed(Routes.HOME);
          },
          child: Text(
            "dosent_have_code".tr(),
            textAlign: TextAlign.center,
            style: AppFonts.fontRegularSmall.copyWith(color: textColor),

          ),
        ),
        const SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
            resend();
          },
          child: Text(
            "resend_code".tr(),
            textAlign: TextAlign.center,
            style: AppFonts.fontBoldMeduim.copyWith(color: primaryColor),

          ),
        ),
      ],
    );
  }
  void doConfirm() async {
    if(_code!=null && _code!.length==4)
      {
        AppLoading.setLoading("please_wait".tr());
        bool res= await authController.authUser(_code!,LocalDataHelper.mobile);
        AppLoading.hideLoading();
        if(res)
        {
          Navigator.pushReplacementNamed(
            Navigation.getContext(),
            Routes.loginScreen,
          );
        }
      }
    else
      {
        MessageHelper.showMessageWithoutContext("error_code_length".tr());
      }


  }
  resend()async
  {
    AppLoading.setLoading("please_wait".tr());
    await authController.resendCode(LocalDataHelper.mobile);
    AppLoading.hideLoading();
  }

}
