// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/getlocation_model.dart';
import '../../../model/teacher_list.dart';

class TeacherListProvider extends ChangeNotifier {
  String? culocation = "";
  TeacherList? teacherList;
  double latitude = 0;
  double longitude = 0;
  List<int> showContact = [];
  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    if (data != null) {
      culocation = data.locationname;
      longitude = data.long;
      latitude = data.lat;
      notifyListeners();
    }
  }

  addList(int id) {
    showContact.add(id);
    notifyListeners();
  }

  bool isLoading = false;
  bool success = false;

  getlist(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (longitude == 0 && latitude == 0) {
      await getAddress();
    }
    final prefs = UserPrefs();
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
    };

    Map data = {
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      // "filter_board": "ICSC,CBSC",
      // "filter_class": "XI- Class X",
      // "filter_place": "At My Place,At Teachers Place",
      // "filter_teacher": "M"
    };
    if (prefs.getData("filterclass") != null) {
      data['filter_class'] = prefs.getData("filterclass");
    }
    if (prefs.getData("filterboard") != null) {
      data['filter_board'] = prefs.getData("filterboard");
    }
    if (prefs.getData("filterplace") != null) {
      data['filter_place'] = prefs.getData("filterplace");
    }
    if (prefs.getData("filtergender") != null) {
      data['filter_teacher'] = prefs.getData("filtergender") == "Male"
          ? "M"
          : prefs.getData("filtergender") == "Female"
              ? "F"
              : "ANY";
    }

    final url = Uri.parse("${baseUrl}user/get-teacher-list");

    // try {
    final response = await http.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      TeacherList res = TeacherList.fromJson(json);
      teacherList = res;
      // if (loginResponse.status!) {
      // } else {
      //   CostomSnackbar.show(context, "ahow");
      // }

      isLoading = false;
      success = true;
    }
    // } catch (e) {
    //   print("$e");
    //
    //   CostomSnackbar.show(context, "$e");
    //   //Get.snackbar('Error', 'An error occurred');
    // } finally {
    //   isLoading = false;
    // }
    notifyListeners();
  }
}
