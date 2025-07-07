// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ffi';

import 'package:chat_app_fr_this_time/core/model/message_model.dart';
import 'package:chat_app_fr_this_time/core/model/user_model.dart';
import 'package:chat_app_fr_this_time/core/services/chat_service.dart';
import 'package:chat_app_fr_this_time/core/viewmodels/baseViewmodel.dart';
import 'package:flutter/widgets.dart';

class ChatroomViewmodel extends Baseviewmodel {
  final ChatService _chatService;
  final UserModel _currentUser;
  final UserModel _receiver;

  StreamSubscription? _subscription;
  ChatroomViewmodel(this._chatService, this._currentUser, this._receiver) {
    getChatRoom();
    _subscription = _chatService.fetchMessage(chatRoomId).listen((data) {
      _messages = data.docs.map((e) => MessageModel.fromMap(e.data())).toList();
      notifyListeners();
    });
  }

  String chatRoomId = "";
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  List<MessageModel> _messages = [];

  List<MessageModel> get messages => _messages;

  getChatRoom() {
    if (_currentUser.uid.hashCode > _receiver.uid.hashCode) {
      chatRoomId = "${_currentUser.uid}_${_receiver.uid}";
    } else {
      chatRoomId = "${_receiver.uid}_${_currentUser.uid}";
    }
  }

  saveMessage() async {
    try {
      if (_controller.text.isEmpty) {
        throw Exception("tin nhắn trống");
      }
      final now = DateTime.now();

      final message = MessageModel(
        id: now.millisecondsSinceEpoch.toString(),
        message: _controller.text,
        receiverId: _receiver.uid,
        senderId: _currentUser.uid,
        timestamp: now,
      );
      await _chatService.saveMessage(message.toMap(), chatRoomId);
      _chatService.updateLastMessage(
        _receiver.uid!,
        _currentUser.uid!,
        _controller.text,
        now.millisecondsSinceEpoch,
      );
      _controller.clear();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _subscription?.cancel();
  }
}
