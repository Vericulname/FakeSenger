import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.verticalSpace,
            Text(
              "đăng ký tài khoản",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,
            Text("hãy nhập thông tin của bạn", style: TextStyle(fontSize: 20)),
            TextField(),
          ],
        ),
      ),
    );
  }
}
