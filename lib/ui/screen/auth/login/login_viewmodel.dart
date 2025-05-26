import 'dart:developer';

import 'package:chat_app_fr_this_time/core/enum/enum.dart';
import 'package:chat_app_fr_this_time/core/services/auth_service.dart';
import 'package:chat_app_fr_this_time/core/viewmodels/baseViewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewmodel extends Baseviewmodel {
  LoginViewmodel(this._auth);

  final AuthService _auth;
  String _password = '';
  String _email = '';

  setPassword(String val) {
    _password = val;
    log("password: $_password");
  }

  setEmail(String val) {
    _email = val;
    log("email: $_email");
  }

  login() async {
    setState(ViewState.loading);
    try {
      await _auth.login(_email, _password);
      setState(ViewState.idle);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      setState(ViewState.idle);
      rethrow;
    } catch (e) {
      setState(ViewState.idle);
      log(e.toString());
      rethrow;
    }
  }
}
