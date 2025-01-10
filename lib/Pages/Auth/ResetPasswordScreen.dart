import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Pages/Auth/AuthController.dart';
import '../../Utils/AppFonts.dart';

import '../../Helper/AppLoading.dart';
import '../../Helper/LocalDataHelper.dart';
import '../../Helper/MessageHelper.dart';
import '../../Helper/ValidatorHelper.dart';
import '../../Routes/Routes.dart';
import '../../Routes/navigation.dart';
import '../../Utils/CommonConstants.dart';
import '../../Utils/sizes_consts.dart';
import '../../Utils/style.dart';
import '../../Widget/ButtonWidget.dart';
import '../../Widget/CommonWidget.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Widget/CustomInput.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ResetPasswordScreen> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final _phoneController = TextEditingController();
  final _codeController=TextEditingController();
  final _passwordController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController authController=AuthController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidget.rowHeight(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.grey), // Icon inside the button
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // Background color of the button
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(15),  // Makes the container round
                ),
                child: IconButton(
                  icon: Icon(Icons.question_mark_rounded, color: Colors.white), // Icon inside the button
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                ),
              ),

            ],
          ),
          CommonWidget.rowHeight(height: 20),
          Text(
            "forget_your_password".tr(),
            textAlign: TextAlign.center,
            style: AppFonts.fontBoldMeduim.copyWith(color: textColor),
          ),
          CommonWidget.rowHeight(height: 20),
          Text(
            "please_your_password".tr(),
            textAlign: TextAlign.center,
            style: AppFonts.fontRegularMeduim.copyWith(color: textColor),
          ),
          CommonWidget.rowHeight(height: 20),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomInput(lable: 'mobile'.tr(), validator: 'required'.tr(), Controller: _phoneController,keyboardType: TextInputType.phone, obscureText: false, icon: Icons.phone_android,
                    formats:  <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(CommonConstants.phoneLength),
                    ],focusNode1: focusNode1,focusNode2: focusNode2,),
                  CommonWidget.rowHeight(height: 20),
                  CustomInput(lable: 'code'.tr(), validator: 'required'.tr(), Controller: _codeController,keyboardType: TextInputType.text, obscureText: false, icon: Icons.code, formats: [],focusNode1:focusNode2 ,focusNode2: focusNode3,),
                  CommonWidget.rowHeight(height: 20),
                  CustomInput(lable: 'password'.tr(), validator: 'required'.tr(), Controller: _passwordController,keyboardType: TextInputType.text,obscureText: true, icon: Icons.lock, formats: [],focusNode1: focusNode3,),
                  CommonWidget.rowHeight(height: 20),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          horizontal: CommonConstants.horizontalPaddingButton,
                          vertical: CommonConstants.verticalPaddingButton),
                      child: ButtonWidget(
                        onPress: () => doWork(),
                        title: 'send'.tr(),
                        buttonColor: primaryColor,
                        titleColor: whiteColor,
                        borderColor: primaryColor,
                        paddingHorizontal: 20.0,
                        paddingVertical:
                        SizesConstant.verticalButtonPad,
                        size: 0,
                      )
                  ),

                ],
              ),
            ),
          )
          /*


           */
        ],
      ),
    );
  }
  void doWork() async {
    if (_formKey.currentState!.validate() && ValidatePhone())
    {
      LocalDataHelper.mobile=CommonConstants.formatPhoneNumber(_phoneController.text.toString().trim());

      AppLoading.setLoading("please_wait".tr());
      bool res= await authController.resetPassword(LocalDataHelper.mobile,_codeController.text.toString().trim(),_passwordController.text.toString().trim());
      AppLoading.hideLoading();
      if(res)
      {
        Navigator.pushNamed(
          Navigation.getContext(),
          Routes.confirmScreen,
        );
      }

    }

    else if(!ValidatePhone())
    {
      MessageHelper.showMessage(context,'msg_phone'.tr());
    }


  }

  bool ValidatePhone()
  {
    bool valid=false;
    if(_phoneController.text!=null)
    {
      valid=ValidatorHelper.isPhoneValid(_phoneController.text.toString().trim());
    }
    return valid;
  }
}