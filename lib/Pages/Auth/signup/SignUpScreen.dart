import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Common/UserInfo.dart';
import '../../../Helper/ImageAssetsHelper.dart';
import '../../../Helper/LocalDataHelper.dart';
import '../../../Helper/MessageHelper.dart';
import '../../../Helper/ValidatorHelper.dart';
import '../../../Utils/AppFonts.dart';
import '../../../Utils/CommonConstants.dart';
import '../../../Utils/style.dart';
import '../../../Widget/ButtonWidget.dart';
import '../../../Widget/CommonWidget.dart';
import '../../../Widget/CustomInput.dart';
import '../AuthController.dart';
import 'package:easy_localization/easy_localization.dart';

import '../FooterWidget1.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  AuthController authController=AuthController();
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenPadding = MediaQuery.of(context).size.width * CommonConstants.paddingHorizontal;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: whiteBack,
          body: Padding(
            padding: EdgeInsets.only(bottom: CommonConstants.paddingBottom),
            child: Container(
              color: Colors.white,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(
                  horizontal: screenPadding),
              child: _buildForms(context),
            ),
          ),
        ),
      ],
    );
  }

  void onClick() {}

  Widget _buildForms(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40,),
            ImageAssetsHelper.getImageAssetsWithFit(
              ImageAssetsHelper.logoApp,
              double.infinity,
              50,
              BoxFit.contain,
            ),
            CommonWidget.rowHeight(height: 10),
            Text(
              "welcome".tr(),
              textAlign: TextAlign.center,
                style: AppFonts.fontBoldLarge
            ),
            Text(
              "app_name".tr(),
              textAlign: TextAlign.center,
              style: AppFonts.fontBoldLarge.copyWith(color: primaryColor),
            ),
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
            FooterWidget1()
          ],
        ),
      ),
    );
  }
  Widget buildFormSignUp()
  {
    return Column(
      children: [
        CommonWidget.rowHeight(height: 20),
        CustomInput(lable: 'user_name'.tr(), validator: 'required'.tr(), Controller: _usernameController,keyboardType: TextInputType.text, obscureText: false, icon: Icons.person, formats: [],focusNode1: focusNode1,focusNode2: focusNode2,),
        CommonWidget.rowHeight(height: 20),
        CustomInput(lable: 'email'.tr(), validator: 'required'.tr(), Controller: _emailController,keyboardType: TextInputType.text, obscureText: false, icon: Icons.email, formats: [],focusNode1: focusNode2,focusNode2: focusNode3,),
        CommonWidget.rowHeight(height: 20),
        CustomInput(lable: 'mobile'.tr(), validator: 'required'.tr(), Controller: _phoneController,keyboardType: TextInputType.phone, obscureText: false, icon: Icons.phone_android,
          formats:  <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(CommonConstants.phoneLength),
          ],focusNode1: focusNode3,focusNode2: focusNode4,),
        CommonWidget.rowHeight(height: 20),
        CustomInput(lable: 'password'.tr(), validator: 'required'.tr(), Controller: _passwordController,keyboardType: TextInputType.text,obscureText: true, icon: Icons.lock, formats: [],focusNode1: focusNode4,),

        CommonWidget.rowHeight(height: 10),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: CommonConstants.horizontalPaddingButton,
                vertical: CommonConstants.verticalPaddingButton),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor, // Background color of the button
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),  // Makes the container round
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white), // Icon inside the button
                    onPressed: () {
                     Navigator.of(context).pop();
                    },
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    doSignUp();
                  },
                  child: Text(
                    "create_account".tr(),
                    textAlign: TextAlign.center,
                    style: AppFonts.fontBoldMeduim.copyWith(color: textColor),
                  ),
                ),
              ],
            )
        ),
        CommonWidget.rowHeight(height: 10),
      ],
    );
  }
  void doSignUp() async {
    if (_formKey.currentState!.validate()&& ValidateEmail() && ValidatePhone())
    {
      LocalDataHelper.mobile=CommonConstants.formatPhoneNumber(_phoneController.text.toString().trim());
      UserInfo userInfo = UserInfo(
        id: 0,
        email: _emailController.text.toString().trim(),
        mobile: CommonConstants.formatPhoneNumber(_phoneController.text.toString().trim()),
        password: _passwordController.text.toString().trim(), user_name: _usernameController.text.toString().trim(),
      );
      /*
      AppLoading.setLoading("please_wait".tr());
      bool res= await authController.createUser(userInfo);
      AppLoading.hideLoading();
      if(res)
      {
        Navigator.pushNamed(
          Navigation.getContext(),
          Routes.confirmScreen,
        );
      }

       */

    }
    else if(!ValidateEmail())
    {
      MessageHelper.showMessage(context,'msg_email'.tr());
    }
    else if(!ValidatePhone())
    {
      MessageHelper.showMessage(context,'msg_phone'.tr());
    }


  }
  bool ValidateEmail()
  {
    bool valid=false;
    if(_emailController.text!=null)
    {
      valid=ValidatorHelper.isEmailValid(_emailController.text.toString().trim());
    }
    return valid;
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
