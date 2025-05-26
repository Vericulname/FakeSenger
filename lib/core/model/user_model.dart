// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? username;
  String? email;
  String? password;
  String? uid;
  Map<String, dynamic>? lastMessage;
  int? unreadMessageCount;
  UserModel({
    this.username,
    this.email,
    this.password,
    this.uid,
    this.lastMessage,
    this.unreadMessageCount,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? password,
    String? uid,
    Map<String, dynamic>? lastMessage,
    int? unreadMessageCount,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadMessageCount: unreadMessageCount ?? this.unreadMessageCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'uid': uid,
      'lastMessage': lastMessage,
      'unreadMessageCount': unreadMessageCount,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      lastMessage:
          map['lastMessage'] != null
              ? Map<String, dynamic>.from(
                (map['lastMessage'] as Map<String, dynamic>),
              )
              : null,
      unreadMessageCount:
          map['unreadMessageCount'] != null
              ? map['unreadMessageCount'] as int
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, password: $password, uid: $uid, lastMessage: $lastMessage, unreadMessageCount: $unreadMessageCount)';
  }
}
