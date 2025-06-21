import 'package:chat_app_fr_this_time/core/viewmodels/baseViewmodel.dart';

class HomescreenViewmodel extends Baseviewmodel {
  int _index = 0;

  int get index => _index;

  setIndex(int val) {
    if (_index != val) {
      _index = val;
      notifyListeners();
    }
  }
}
