import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:vida/model/getlocation_model.dart';
import 'package:http/http.dart' as http;
import '../../../../commonfun/get_location.dart';
import '../../../../config/baseUrl.dart';
import '../../../../config/sharedPrefs.dart';
import '../../../model/lead_list.dart';
import '../../commonWidget/costum_snackbar.dart';

class LeadProvider extends ChangeNotifier {
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

  LeadList? leadlist;
  getlist(BuildContext context) async {
    isLoading = true;
    final prefs = UserPrefs();
    var token = prefs.getData("token");

    Map<String, String> headers = {
      "x-access-token": "$token",
      //  "Content-type": "application/json"
    };
    Map data = {
      "latitude": latitude,
      "longitude": longitude,
    };

    final url = Uri.parse("${baseUrl}enquiry/user-leades");

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
