import 'dart:developer';

import 'package:chat_app_fr_this_time/core/constants/color.dart';
import 'package:chat_app_fr_this_time/core/constants/string.dart';
import 'package:chat_app_fr_this_time/core/constants/text_style.dart';
import 'package:chat_app_fr_this_time/core/services/auth_service.dart';
import 'package:chat_app_fr_this_time/core/services/database_service.dart';
import 'package:chat_app_fr_this_time/extensions/snackBar_extension.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/login/login_viewmodel.dart';
import 'package:chat_app_fr_this_time/ui/screen/auth/signup/signup_viewmodel.dart';
import 'package:chat_app_fr_this_time/ui/wiget/customButton.dart';
import 'package:chat_app_fr_this_time/ui/wiget/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupViewmodel>(
      create: (context) => SignupViewmodel(AuthService(), DatabaseService()),
      child: Consumer<SignupViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.verticalSpace,
                  Text("Đăng ký tài khoản", style: h),
                  20.verticalSpace,
                  Text("Hãy nhập thông tin của bạn", style: small),
                  30.verticalSpace,
                  CustomTextField(
                    hintText: "Tên tài khoản",
                    onChanged: model.setName,
                  ),
                  30.verticalSpace,
                  CustomTextField(hintText: "Email", onChanged: model.setEmail),
                  30.verticalSpace,
                  CustomTextField(
                    hintText: "Mật khẩu",
                    onChanged: model.setPassword,
                  ),
                  30.verticalSpace,
                  CustomTextField(
                    hintText: "Nhập lại mật khẩu",
                    onChanged: model.setConfirmPassword,
                  ),
                  30.verticalSpace,
                  CustomButton(
                    onPressed: () {
                      try {
                        model.signup();
                        context.showSnackBar("Đăng ký thành công");
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        context.showSnackBar(e.toString());
                      } catch (e) {
                        context.showSnackBar(e.toString());
                      }
                    },
                    buttonName: "Đăng ký",
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Đã có tài khoản? ",
                        style: small.copyWith(color: grey),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, login),
                        child: Text(
                          "Đăng nhập",
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
