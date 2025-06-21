import 'package:chat_app_fr_this_time/core/enum/enum.dart';
import 'package:flutter/material.dart';

class Baseviewmodel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
