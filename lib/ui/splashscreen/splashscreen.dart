import 'dart:async';

import 'package:chat_app_fr_this_time/core/constants/string.dart';
import 'package:chat_app_fr_this_time/ui/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashscreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, wrapper);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(appLogo, height: 300, width: 300, fit: BoxFit.cover),
      ),
    );
  }
}
