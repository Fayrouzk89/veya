import 'package:flutter/widgets.dart';

import '../Pages/Auth/AuthScreen.dart';
import '../Pages/Auth/ConfirmScreen.dart';
import '../Pages/Auth/ForgetPasswordScreen.dart';
import '../Pages/Auth/ResetPasswordScreen.dart';
import '../Pages/Auth/login/LoginScreen.dart';
import '../Pages/Auth/signup/SignUpScreen.dart';
import '../Pages/Home/HomeScreen.dart';
import '../Pages/Splash/SplashScreen.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (_) => SplashScreen(),
  Routes.homeScreen: (_) => HomeScreen(),
  Routes.scanScreen: (_) => AuthScreen(),
  Routes.loginScreen: (_) => LoginScreen(),
  Routes.registerScreen: (_) => SignUpScreen(),
  Routes.confirmScreen: (_) => ConfirmScreen(),
  Routes.forgetPasswordScreen: (_) => ForgetPasswordScreen(),
  Routes.ResetPasswordScreen: (_) => ResetPasswordScreen(),


};