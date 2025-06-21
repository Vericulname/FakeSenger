import 'package:chat_app_fr_this_time/provider/user_provide.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/login/login_screen.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final userData = snapshot.data;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("lỗi"));
        }

        if (userData == null) {
          return LoginScreen();
        } else {
          userProvider.loadUser(userData.uid);
          return Homescreen();
        }
      },
    );
  }
}
