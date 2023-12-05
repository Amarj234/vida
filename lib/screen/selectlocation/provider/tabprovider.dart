import 'package:flutter/material.dart';

import '../../../commonfun/dropdowndata.dart';
import '../../../model/dropdown_data.dart';

class TabProvider extends ChangeNotifier {
  List<String> tabval = [];
  int selectradeo = 4;

  List parents = [];
  // ignore: non_constant_identifier_names
  SelectTab(String val) {
    if (tabval.contains(val) == true) {
      tabval.remove(val);
    } else {
      tabval.add(val);
    }
    notifyListeners();
  }

  bool isLoding = false;
  setdata(int id) async {
    isLoding = true;
    notifyListeners();
    DropdownData? res = await DropdownDatas().getdata(id);
    parents = [];
    for (var element in res!.data) {
      parents.add(element.propsTitle);
    }
    isLoding = false;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  SelectRadio(int val) {
    selectradeo = val;
    notifyListeners();
  }
}
