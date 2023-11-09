import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  List<String> slclass = [];
  List<String> slclassvalue = [
    "Play Group - V",
    "VI - X",
    "XI - XII",
    "B.Com",
    "B.Sc",
    "NEET",
    "CAT",
    "B.Tech",
    "BCA",
    "IIT-JEE",
    "Music",
    "Drawing",
    "Dance",
    "Spoken Eng",
    "CPT",
    "Handwriting",
    "French",
    "German",
    "Sanskrit"
  ];
  List<String> board = [];
  List<String> boardvalue = ["ICSC", "CBSC", "WB", "Others"];
  List<String> teachergen = [];
  List<String> teachergenvalue = ["Female", "Male", "Both"];
  List<String> place = [];
  List<String> placevalue = [
    "At My Place",
    "At Teacher’s Place",
    "In a Coaching Center",
    "Online Class"
  ];

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
    if (teachergen.contains(val) == true) {
      teachergen.remove(val);
    } else {
      teachergen.add(val);
    }
    notifyListeners();
  }

  clearFilter() {
    slclass = [];
    board = [];
    place = [];
    teachergen = [];
    notifyListeners();
  }
}
