import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../commonfun/get_location.dart';
import '../../../config/baseUrl.dart';
import '../../../config/sharedPrefs.dart';
import '../../../model/getlocation_model.dart';
import '../../../model/teacher_list.dart';

class AppmessageProvider extends ChangeNotifier {
  String? culocation = "";
  TeacherList? teacherList;
  double latitude = 0;
  double longitude = 0;
  List<int> showContact = [];
  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    print("mylocation234 $data");
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
    final prefs = UserPrefs();
    var id = prefs.getData("id");
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-type": "application/json"
    };

    Map data = {
      "latitude": latitude,
      "longitude": longitude,
    };
    final url = Uri.parse("${baseUrl}user/get-teacher-list");

    print(url);
    try {
      final request = await http.Request(
        'GET',
        url,
      );
      request.body = jsonEncode(data);
      request.headers.addAll(headers);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
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
        print(json);
      }
    } catch (e) {
      //Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
