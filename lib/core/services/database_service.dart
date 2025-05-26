import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> loadUser(String uid) async {
    try {
      final res = await _db.collection("user").doc(uid).get();
      if (res.data() != null) {
        log("lấy người dùng thành công");
        return res.data();
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<void> saveUser(Map<String, dynamic> userdata) async {
    try {
      await _db.collection("user").doc(userdata["uid"]).set(userdata);
      log("lưu người dùng thành công");
    } catch (e) {
      rethrow;
    }
  }
}
