import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> loadUser(String uid) async {
    try {
      log("uid: $uid");
      final res = await _db.collection("user").doc(uid).get();
      log("res: ${res.data()}");

      if (res.data() != null) {
        log("lấy thông tin thành công");
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

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUserStream(
    String currentUid,
  ) =>
      _db.collection("user").where("uid", isNotEqualTo: currentUid).snapshots();
}
