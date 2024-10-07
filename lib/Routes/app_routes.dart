import 'package:flutter/material.dart';
import 'package:home_roti_login_new/Screen/SignUp_Pages/otp_enter.dart';
import 'package:home_roti_login_new/Screen/SignUp_Pages/otp_expired.dart';
import 'package:home_roti_login_new/Screen/SignUp_Pages/otp_incorrect.dart';
import 'package:home_roti_login_new/Screen/SignUp_Pages/otp_send.dart';
import 'package:home_roti_login_new/Screen/login_page.dart';
import 'package:home_roti_login_new/Screen/SignUp_Pages/signup_page.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String signup = '/';
  String login = 'login_page';
  String otpSend = 'otp_send';
  String otpEnter = 'otp_enter';
  String otpExpired = 'otp_expired';
  String otpIncorrect = 'otp_incorrect';

  Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => SignupPage(),
    'login_page': (context) => LoginPage(),
    'otp_send': (context) => const OtpSend(),
    'otp_enter': (context) => const OtpEnter(),
    'otp_expired': (context) => const OtpExpired(),
    'otp_incorrect': (context) => const OtpIncorrect(),
  };
}
