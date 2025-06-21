import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/string.dart';
import 'package:chat_app_fr_this_time/provider/user_provide.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/chatList/chatList_screen.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/home_screen_viewmodel.dart';
import 'package:chat_app_fr_this_time/ui/screen/home/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  static final List<Widget> _screenList = [ChatlistScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create: (context) => HomescreenViewmodel(),
      child: Consumer<HomescreenViewmodel>(
        builder: (context, model, _) {
          return currentUser == null
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                body: Homescreen._screenList[model.index],
                bottomNavigationBar: CustomNavBar(
                  onTap: model.setIndex,
                  item: [
                    BottomNavigationBarItem(
                      icon: CustomNavBarItems(iconPath: messengerIcon),
                      label: ' ',
                    ),
                    BottomNavigationBarItem(
                      icon: CustomNavBarItems(iconPath: userIcon),
                      label: ' ',
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key, required this.item, this.onTap});

  final List<BottomNavigationBarItem> item;
  final void Function(int)? onTap;

  final borderRadius = BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: black, blurRadius: 10, spreadRadius: 0)],
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BottomNavigationBar(items: item, onTap: onTap),
      ),
    );
  }
}

class CustomNavBarItems extends StatelessWidget {
  const CustomNavBarItems({super.key, required this.iconPath});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Image.asset(iconPath, height: 20, width: 20),
    );
  }
}
