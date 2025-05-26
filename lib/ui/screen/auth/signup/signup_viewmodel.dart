import 'dart:developer';

import 'package:chat_app_fr_this_time/core/enum/enum.dart';
import 'package:chat_app_fr_this_time/core/model/user_model.dart';
import 'package:chat_app_fr_this_time/core/services/auth_service.dart';
import 'package:chat_app_fr_this_time/core/services/database_service.dart';
import 'package:chat_app_fr_this_time/core/viewmodels/baseViewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupViewmodel extends Baseviewmodel {
  SignupViewmodel(this._auth, this._db);

  final AuthService _auth;
  final DatabaseService _db;

  String _password = '';
  String _email = '';
  String _name = '';
  String _confirmPassword = '';

  setName(String val) {
    _name = val;
    log("password: $_name");
  }

  setEmail(String val) {
    _email = val;
    log("email: $_email");
  }

  setPassword(String val) {
    _password = val;
    log("password: $_password");
  }

  setConfirmPassword(String val) {
    _confirmPassword = val;
    log("confirmPassword: $_confirmPassword");
  }

  signup() async {
    setState(ViewState.loading);
    try {
      final res = await _auth.signup(_email, _password);

      if (res != null) {
        UserModel user = UserModel(
          uid: res.uid,
          username: _name,
          email: _email,
          password: _password,
        );

        _db.saveUser(user.toMap());
      }

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
