import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../config/baseUrl.dart';
import '../../../../config/sharedPrefs.dart';
import '../../../model/lead_list.dart';
import '../../commonWidget/costum_snackbar.dart';

class NotificationProvider extends ChangeNotifier {
  bool isLoading = true;
  bool success = false;

  LeadList? leadlist;
  getlist(BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      //  "Content-type": "application/json"
    };
    // Map data = {
    //   "latitude": latitude,
    //   "longitude": longitude,
    // };

    final url = Uri.parse("${baseUrl}enquiry/user-leades");

    try {
      final request = http.Request(
        'GET',
        url,
      );
      request.body = jsonEncode("data");
      request.headers.addAll(headers);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        LeadList res = LeadList.fromJson(json);
        leadlist = res;
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
}
