import 'package:chat_app_fr_this_time/core/constants/string.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/login/login_screen.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/signup/signup_screen.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/homescreen.dart';
import 'package:chat_app_fr_this_time/ui/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => Homescreen());
      case splash:
        return MaterialPageRoute(builder: (context) => Splashscreen());
      case signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (context) => const Scaffold(
                body: Center(child: Text("có gì đó bị lỗi x.x")),
              ),
        );
    }
  }
}
