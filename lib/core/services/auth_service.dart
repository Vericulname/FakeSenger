import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      final authCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authCredential != null) {
        log("Đăng nhập thành công");
        return authCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<User?> signup(String email, String password) async {
    try {
      final authCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authCredential != null) {
        log("Đăng ký thành công");
        return authCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
