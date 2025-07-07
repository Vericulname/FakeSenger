import 'package:chat_app_fr_this_time/core/model/user_model.dart';
import 'package:chat_app_fr_this_time/core/services/auth_service.dart';
import 'package:chat_app_fr_this_time/provider/user_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Provider.of<UserProvider>(context, listen: false).clearUser();
            AuthService().logout();
          },
          child: Text("đăng xuất"),
        ),
      ),
    );
  }
}
