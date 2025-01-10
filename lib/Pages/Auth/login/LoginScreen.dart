import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../../Common/UserInfo.dart';
import '../../../Helper/AppLoading.dart';
import '../../../Helper/ImageAssetsHelper.dart';
import '../../../Helper/KeyBoardHelper.dart';
import '../../../Helper/MessageHelper.dart';
import '../../../Helper/ValidatorHelper.dart';
import '../../../Routes/Routes.dart';
import '../../../Routes/navigation.dart';
import '../../../Utils/AppFonts.dart';
import '../../../Utils/CommonConstants.dart';
import '../../../Utils/sizes_consts.dart';
import '../../../Utils/style.dart';
import '../../../Widget/ButtonWidget.dart';
import '../../../Widget/CommonWidget.dart';
import '../../../Widget/CustomInput.dart';
import '../../Home/HomeScreen.dart';
import '../AuthController.dart';
import '../FooterWidget.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
          )
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
              100,
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
            CommonWidget.rowHeight(height: 20),
            CustomInput(lable: 'email'.tr(), validator: 'required'.tr(), Controller: _emailController,keyboardType: TextInputType.text, obscureText: false, icon: Icons.email, formats: [], focusNode1: focusNode1,focusNode2: focusNode2,),
            CommonWidget.rowHeight(height: 20),
            CustomInput(lable: 'password'.tr(), validator: 'required'.tr(), Controller: _passwordController,keyboardType: TextInputType.text,obscureText: true, icon: Icons.lock, formats: [],focusNode1: focusNode2,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  Navigation.getContext(),
                  Routes.forgetPasswordScreen,
                );
              },
              child: Text(
                'forget_password'.tr(),
                textAlign: TextAlign.end,
                style: AppFonts.fontBoldSmall.copyWith(color: textColor),
              ),
            ),
            CommonWidget.rowHeight(height: 10),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: CommonConstants.horizontalPaddingButton,
                    vertical: CommonConstants.verticalPaddingButton),
                child: ButtonWidget(
                  onPress: () => doLogin(),
                  title: 'continue'.tr(),
                  buttonColor: primaryColor,
                  titleColor: whiteColor,
                  borderColor: primaryColor,
                  paddingHorizontal: 20.0,
                  paddingVertical:
                  SizesConstant.verticalButtonPad,
                  size: 0,
                )
            ),
            CommonWidget.rowHeight(height: 10),
            FooterWidget()

          ],
        ),
      ),
    );
  }
  bool validateEmail()
  {
    bool valid=false;
    if(_emailController.text!=null)
    {
      valid=ValidatorHelper.isEmailValid(_emailController.text.toString().trim());
    }
    return valid;
  }
  void doLogin() async {
    KeyBoardHelper.hideKeyboard(context);
    if (_formKey.currentState!.validate()&& validateEmail())
    {
    UserInfo userInfo = UserInfo(
        id: 0,
        email: _emailController.text.toString().trim(),
        mobile: "",
        password: _passwordController.text.toString().trim(),
        user_name: "",
       );
    AppLoading.setLoading("please_wait".tr());
    bool res= await authController.validateUser(userInfo);
    AppLoading.hideLoading();
    if(res)
      {
        Navigator.pushAndRemoveUntil(
          Navigation.getContext(),
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false, // Remove all routes
        );
        /*
        Navigator.pushReplacementNamed(
          Navigation.getContext(),
          Routes.homeScreen,
        );

         */
      }
    }
    else if(!validateEmail())
    {
      MessageHelper.showMessage(context,"Invalid credentials");
    }

  }
}
