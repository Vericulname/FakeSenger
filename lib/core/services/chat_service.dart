import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final _fire = FirebaseFirestore.instance;

  saveMessage(Map<String, dynamic> message, String chatRoomId) async {
    try {
      await _fire
          .collection("chatRoom")
          .doc(chatRoomId)
          .collection("message")
          .add(message);
    } catch (e) {
      rethrow;
    }
  }

  updateLastMessage(
    String receiverUId,
    String currentUId,
    String chatRoomId,
    String message,
    int timestamp,
  ) async {
    try {
      await _fire.collection("user").doc(currentUId).update({
        "lastMessage": {
          "content": message,
          "timestamp": timestamp,
          "chatRoomId": chatRoomId,
        },
        "unreadMessageCount": FieldValue.increment(1),
      });
      _fire.collection("user").doc(receiverUId).update({
        "lastMessage": {
          "content": message,
          "timestamp": timestamp,
          "chatRoomId": chatRoomId,
        },
        "unreadMessageCount": 0,
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchMessage(String chatRoomId) {
    return _fire
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
