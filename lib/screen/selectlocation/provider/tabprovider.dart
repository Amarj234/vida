import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  List<int> tabval = [];
  int selectradeo = 1;
  // ignore: non_constant_identifier_names
  SelectTab(int val) {
    if (tabval.contains(val) == true) {
      tabval.remove(val);
    } else {
      tabval.add(val);
    }
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  SelectRadio(int val) {
    selectradeo = val;
    notifyListeners();
  }
}
