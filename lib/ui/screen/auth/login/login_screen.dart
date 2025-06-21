import 'dart:developer';

import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/string.dart';
import 'package:chat_app_fr_this_time/core/constants/text_style.dart';
import 'package:chat_app_fr_this_time/core/services/auth_service.dart';
import 'package:chat_app_fr_this_time/extensions/snackBar_extension.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/login/login_viewmodel.dart';
import 'package:chat_app_fr_this_time/ui/wiget/CustomButton.dart';
import 'package:chat_app_fr_this_time/ui/wiget/CustomTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewmodel>(
      create: (context) => LoginViewmodel(AuthService()),
      child: Consumer<LoginViewmodel>(
        builder: (context, model, _) {
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

                  CustomTextField(hintText: "Email", onChanged: model.setEmail),
                  30.verticalSpace,
                  CustomTextField(
                    hintText: "Mật khẩu",
                    onChanged: model.setPassword,
                  ),
                  30.verticalSpace,
                  CustomButton(
                    onPressed: () {
                      try {
                        model.login();
                        context.showSnackBar("Đăng nhập thành công");
                      } on FirebaseAuthException catch (e) {
                        context.showSnackBar(e.toString());
                      } catch (e) {
                        context.showSnackBar(e.toString());
                      }
                    },
                    buttonName: "Đăng nhập",
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chưa có tài khoản? ",
                        style: small.copyWith(color: grey),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, signup),

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
        },
      ),
    );
  }
}
