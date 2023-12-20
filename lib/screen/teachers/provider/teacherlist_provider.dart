// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/getlocation_model.dart';
import '../../../model/teacher_list.dart';
import '../../../model/your_balance.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../subscribe/subscribe_pay.dart';

class TeacherListProvider extends ChangeNotifier {
  String? culocation = "";
  TeacherList? teacherList;
  YourBalance? yourBalance;
  double latitude = 0;
  double longitude = 0;
  List<num> showContact = [];
  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    if (data != null) {
      culocation = data.locationname;
      longitude = data.long;
      latitude = data.lat;
      notifyListeners();
    }
  }

  addList(BuildContext context, num id) async {
    final prefs = UserPrefs();
    var token = prefs.getData("token");
    Map<String, String> headers = {"x-access-token": "$token", "Content-type": "application/json"};
    Map data = {"id": id};
    try {
      final url = Uri.parse("${baseUrl}pay/exp-view");
      print("$id $url");
      final response = await http.post(headers: headers, url, body: json.encode(data));
      print("$url $id  ${response.body}");
      final jsons = jsonDecode(response.body);
      if (jsons['status'] == true) {
        showContact.add(id);
        getBalance(context);
      } else {
        CostomSnackbar.show(context, jsons['message']);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SubscribePay()));
      }
    } catch (e) {
      CostomSnackbar.show(context, "$e");
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  bool isLoading = true;
  bool success = false;

  getBalance(BuildContext context) async {
    final prefs = UserPrefs();
    var token = prefs.getData("token");
    Map<String, String> headers = {
      "x-access-token": "$token",
    };
    final url = Uri.parse("${baseUrl}user/get-user-balance");
    try {
      final response = await http.post(url, headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        YourBalance res = YourBalance.fromJson(json);
        yourBalance = res;
      }
    } catch (e) {
      print("$e");
      CostomSnackbar.show(context, "$e");
    } finally {
      // isLoading = false;
    }
    notifyListeners();
  }

  getlist(BuildContext context) async {
    // isLoading = true;
    if (longitude == 0 && latitude == 0) {
      await getAddress();
    } else {}
    final prefs = UserPrefs();
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      'Content-type': 'application/json',
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

    try {
      final response = await http.post(url, body: json.encode(data), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status'] == true) {
          TeacherList res = TeacherList.fromJson(json);
          teacherList = res;

          for (var elm in teacherList!.dataView!) {
            showContact.add(elm.viewId!);
          }
        }
        isLoading = false;
        success = true;
      }
    } catch (e) {
      print("$e");
      CostomSnackbar.show(context, "$e");
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
