import 'package:flutter/cupertino.dart';

import '../../../commonfun/dropdowndata.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/dropdown_data.dart';

class FilterProvider extends ChangeNotifier {
  List<String> slclass = [];

  List<String> board = [];

  String? teachergen = null;
  List<String> teachergenvalue = ["Female", "Male", "Any"];
  List<String> place = [];

  List<String> placelist = [];

  List<String> bordlist = [];
  List<String> classlist = [];

  bool isLoding = false;

  setdata(int id) async {
    isLoding = true;
    notifyListeners();
    DropdownData? res = await DropdownDatas().getdata(id);

    if (id == 3) {
      bordlist = [];
      for (var element in res!.data) {
        bordlist.add(element.propsTitle);
      }
    } else if (id == 4) {
      classlist = [];
      for (var element in res!.data) {
        classlist.add(element.propsTitle);
      }
    } else {
      placelist = [];
      for (var element in res!.data) {
        placelist.add(element.propsTitle);
      }
    }
    isLoding = false;
    notifyListeners();
  }

  selectPlace(String val) {
    if (place.contains(val) == true) {
      place.remove(val);
    } else {
      place.add(val);
    }
    notifyListeners();
  }

  selectClass(String val) {
    if (slclass.contains(val) == true) {
      slclass.remove(val);
    } else {
      slclass.add(val);
    }
    notifyListeners();
  }

  selectBoard(String val) {
    if (board.contains(val) == true) {
      board.remove(val);
    } else {
      board.add(val);
    }
    notifyListeners();
  }

  selectTeacher(String val) {
    teachergen = val;
    notifyListeners();
  }

  filterSet() {
    final prefs = UserPrefs();
    prefs.removeVal("filterclass");
    prefs.removeVal("filterboard");
    prefs.removeVal("filterplace");
    prefs.removeVal("filtergender");
    if (slclass.isNotEmpty) {
      prefs.setData("filterclass", (slclass).join(","));
    }
    if (board.isNotEmpty) {
      prefs.setData("filterboard", (board).join(","));
    }
    if (place.isNotEmpty) {
      prefs.setData("filterplace", (place).join(","));
    }
    if (teachergen != null) {
      prefs.setData("filtergender", teachergen!);
    }
  }

  getFilter() async {
    slclass = [];
    board = [];
    place = [];
    teachergen = null;
    final prefs = UserPrefs();
    final cls = prefs.getData("filterclass");
    if (cls != null) {
      cls.split(",").forEach((element) {
        slclass.add(element);
      });
    }

    final brd = prefs.getData("filterboard");
    if (brd != null) {
      brd.split(",").forEach((element) {
        board.add(element);
      });
    }

    final pls = prefs.getData("filterplace");
    if (pls != null) {
      pls.split(",").forEach((element) {
        place.add(element);
      });
    }

    final gen = prefs.getData("filtergender");
    if (gen != null) {
      teachergen = gen;
    }
  }

  clearFilter() {
    final prefs = UserPrefs();
    slclass = [];
    board = [];
    place = [];
    teachergen = null;
    prefs.removeVal("filterclass");
    prefs.removeVal("filterboard");
    prefs.removeVal("filterplace");
    prefs.removeVal("filtergender");
    notifyListeners();
  }
}
