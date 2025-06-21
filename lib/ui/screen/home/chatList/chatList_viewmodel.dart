// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:chat_app_fr_this_time/core/enum/enum.dart';
import 'package:chat_app_fr_this_time/core/model/user_model.dart';
import 'package:chat_app_fr_this_time/core/services/database_service.dart';
import 'package:chat_app_fr_this_time/core/viewmodels/baseViewmodel.dart';

class ChatlistViewmodel extends Baseviewmodel {
  final DatabaseService _db;
  final UserModel _user;

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  List<UserModel> _filterusers = [];
  List<UserModel> get filterusers => _users;

  ChatlistViewmodel(this._db, this._user) {
    fetchUser();
  }

  fetchUser() async {
    try {
      setState(ViewState.loading);
      _db.fetchUserStream(_user.uid!).listen((Data) {
        _users = Data.docs.map((e) => UserModel.fromMap(e.data())).toList();
        _filterusers = _users;
        notifyListeners();
      });
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);
      log("lỗi lấy danh sách ng dùng $e");
    }
  }

  searchUser(String val) {
    _filterusers =
        _users.where((e) => e.username!.toLowerCase().contains(val)).toList();
    notifyListeners();
  }
}
