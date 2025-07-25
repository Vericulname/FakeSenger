import 'package:chat_app_fr_this_time/core/constants/string.dart';
import 'package:chat_app_fr_this_time/core/model/user_model.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/login/login_screen.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/signup/signup_screen.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/chatRoom/chatRoom_screen.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/home_screen.dart';
import 'package:chat_app_fr_this_time/ui/splashscreen/splashscreen.dart';
import 'package:chat_app_fr_this_time/ui/wrapper/wrapper.dart';
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
      case wrapper:
        return MaterialPageRoute(builder: (context) => Wrapper());
      case chatRoom:
        return MaterialPageRoute(
          builder: (context) => ChatroomScreen(receiver: args as UserModel),
        );
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
