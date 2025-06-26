// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  final String? message;
  final String? id;
  final String? senderId;
  final String? receiverId;
  final DateTime? timestamp;
  MessageModel({
    this.message,
    this.id,
    this.senderId,
    this.receiverId,
    this.timestamp,
  });

  MessageModel copyWith({
    String? message,
    String? id,
    String? senderId,
    String? receiverId,
    DateTime? timestamp,
  }) {
    return MessageModel(
      message: message ?? this.message,
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp?.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'] != null ? map['message'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      senderId: map['senderId'] != null ? map['senderId'] as String : null,
      receiverId:
          map['receiverId'] != null ? map['receiverId'] as String : null,
      timestamp:
          map['timestamp'] != null
              ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(message: $message, id: $id, senderId: $senderId, receiverId: $receiverId, timestamp: $timestamp)';
  }
}
