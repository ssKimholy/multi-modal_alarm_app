import 'package:flutter/foundation.dart';

class GlobalVar extends ChangeNotifier {
  int index = 0;

  int get getIndex => index;

  void setIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }
}
