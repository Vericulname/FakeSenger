import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/text_style.dart';
import 'package:chat_app_fr_this_time/ui/wiget/CustomButton.dart';
import 'package:chat_app_fr_this_time/ui/wiget/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.verticalSpace,
            Text("Đăng nhập tài khoản", style: h),
            20.verticalSpace,
            Text("Hãy nhập thông tin của bạn", style: small),
            30.verticalSpace,

            CustomTextField(hintText: "Email"),
            30.verticalSpace,
            CustomTextField(hintText: "Mật khẩu"),
            30.verticalSpace,
            CustomButton(onPressed: () {}, buttonName: "Đăng nhập"),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Chưa có tài khoản? ", style: small.copyWith(color: grey)),
                InkWell(
                  onTap: () {
                    try {
                      Navigator.pop(context);
                    } catch (e) {}
                  },
                  child: Text(
                    "Đăng ký",
                    style: small.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
