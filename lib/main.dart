import 'package:chat_app_fr_this_time/core/utils/route_utils.dart';
import 'package:chat_app_fr_this_time/ui/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'FakeSenger Demo',
        home: const Splashscreen(),
        onGenerateRoute: RouteUtils.onGenerateRoute,
      ),
    );
  }
}
