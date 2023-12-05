// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vida/model/getlocation_model.dart';
import 'package:http/http.dart' as http;
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/enquiry_list.dart';
import '../../../model/your_balance.dart';
import '../../commonWidget/costum_snackbar.dart';
import '../../subscribe/subscribe_pay.dart';

class StudentListProvider extends ChangeNotifier {
  String? culocation = "";

  double latitude = 0;
  double longitude = 0;

  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    if (data != null) {
      culocation = data.locationname;
      longitude = data.long;
      latitude = data.lat;
      notifyListeners();
    }
  }

  bool isLoading = false;
  bool success = false;

  EnquiryList? studentlist;
  YourBalance? yourBalance;

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
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  getlist(BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-type": "application/json"
    };
    Map data = {
      "latitude": latitude,
      "longitude": longitude,
    };

    final url = Uri.parse("${baseUrl}enquiry/get-all-enquiry");

    try {
      final request = http.Request(
        'GET',
        url,
      );
      request.body = jsonEncode(data);
      request.headers.addAll(headers);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        EnquiryList res = EnquiryList.fromJson(json);
        studentlist = res;
        // if (loginResponse.status!) {
        // } else {
        //   CostomSnackbar.show(context, "ahow");
        // }

        isLoading = false;
        success = true;
      }
    } catch (e) {
      CostomSnackbar.show(context, "$e");
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  List<int> showContact = [];
  addList(int id, BuildContext context) async {
    final prefs = UserPrefs();

    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      // "Content-type": "application/json"
    };

    try {
      final url = Uri.parse("${baseUrl}enquiry/create-enquiry-view");
      final response = await http.post(headers: headers, url, body: {
        "eid": id.toString(),
      });
      print(response.body);
      final json = jsonDecode(response.body);
      if (json['status'] == true) {
        showContact.add(id);
        getBalance(context);
      } else {
        CostomSnackbar.show(context, json['message']);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SubscribePay()));
      }
    } catch (e) {
      CostomSnackbar.show(context, "$e");
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
